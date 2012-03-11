#encoding: utf-8
class Post < ActiveRecord::Base
  before_destroy :remember_id

  attr_accessible :title, :description, :price, :attachments_attributes, 
                    :prefecture, :year, :shaken_validation, :makes, :model, :displacement, 
                    :mileage, :engine, :transmission, :fuel, :contact_info

  has_many :attachments, :as => :attachable, :dependent => :destroy 
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  scope :simple_search, lambda { |q| where('title LIKE ?', "%#{q}%") }

  after_destroy :remove_id_directory, :remove_tmp_directory

  belongs_to :user

  default_scope :order => 'id DESC'
  validates :title, :presence => true
  validates :attachments, :file_count => { :maximum => 3 }
  validates :attachments, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
  validates :makes, :presence => true
  validates :model, :presence => true
  validates :year, :presence => true
  validates :shaken_validation, :presence => true
  validates :prefecture, :presence => true
  validates :contact_info, :presence => true

  attr_searchable :title, :description, :price, :makes, :year, :prefecture
  attr_unsearchable :user_id
  #
  # A new post when created is assign status 'pending' automatically
  # preventing abusive or inapropriate content to be exposed
  #
  # Return all the posts that are already marked as 'pending'
  # 
  # use: Post.pending
  # 
  def self.pending
    where("status = 'pending'")
  end

  def pending!
    update_attribute(:status, 'pending')
  end

  #
  # It is set to 'active' manually by the administrator after verifying
  # the content itself is all correctly
  #
  # Return all the posts that are already marked as 'active'
  # 
  # use: Post.active
  # 
  def self.active
    where("status = 'active'")
  end

  def activate!
    update_attribute(:status, 'active')
  end

  #
  # It is set to 'review' after the administrator verify it's content
  # and find something wrong or inappropriate to publish.
  #
  # Return all the posts that are already marked as 'review'
  # 
  # use: Post.review
  # 
  def self.review
    where("status = 'review'")
  end

  def review!
    update_attribute(:status, 'review')
  end

  #
  # Return all the posts that are already marked as 'expired'
  #
  # use: Post.expired
  # 
  def self.expired
    where("status = 'expired'")
  end

  def expire!
    update_attribute(:status, 'expired')
  end

  protected

  PREFECTURES = %w(Aichi-ken Akita-ken Aomori-ken Chiba-ken Ehime-ken Fukui-ken Fukuoka-ken Fukushima-ken Gifu-ken Gunma-ken Hiroshima-ken Hokkaido-ken Hyogo-ken Ibaraki-ken Ishikawa-ken Iwate-ken Kagawa-ken Kagoshima-ken Kanagawa-ken Kochi-ken Kumamoto-ken Kyoto-fu Mie-ken Miyagi-ken Miyazaki-ken Nagano-ken Nagasaki-ken Nara-ken Niigata-ken Oita-ken Okayama-ken Okinawa-ken Osaka-fu Saga-ken Saitama-ken Shiga-ken Shimane-ken Shizuoka-ken Tochigi-ken Tokushima-ken Tokyo-to Tottori-ken Toyama-ken Wakayama-ken Yamagata-ken Yamaguchi-ken Yamanashi-ken)

  MAKES = %w(Toyota Nissan Honda Mazda Suzuki Daihatsu Mitsubishi Subaru Alfa-Romeu AMC AMG Audi BMW Chevrolet Chrysler Citroen Dodge Ferrari Lexus Fiat Maserati Ford GMC Hino Hammer Isuzu Jaguar Lamborguini Land-Rover Mercedes-Benz Mini Opel Peugeout Porshe Renault Saab Smart Volkswagem Volvo)

  MAKES_SORT = MAKES.sort << "Outro"
  
  TRANSMISSION = %w(Manual Automático)

  FUEL = %w(Gasolina Álcool Diesel Híbrido)

  def remember_id
    @id = id
    @q = Attachment.where('attachable_id = ?', @id).to_a
  end

  def remove_id_directory
    @q.each do |rm_dir|
      path_to_be_deleted = "#{Rails.root}/public/uploads/attachment/file/#{rm_dir.id}"
      logger.debug path_to_be_deleted
      FileUtils.remove_dir(path_to_be_deleted, :force => true)
    end 
  end

  def remove_tmp_directory
    path_to_be_deleted = "#{Rails.root}/public/uploads/tmp"
    FileUtils.remove_dir(path_to_be_deleted, :force => true)
  end
end
