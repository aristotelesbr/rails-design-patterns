# Form Object
class UserForm
  EMAIL_REGEX = /@/ # Some fancy email regex
  include ActiveModel::Model

  attr_accessor(
    :first_name,
    :last_name,
    :email,
    :bio
  )

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: EMAIL_REGEX

  def save
    return false unless valid?
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      bio: generate_bio
    )
  end

  private

  def generate_bio
    my_str = <<-BIO
    My full name id #{first_name} #{last_name}.
    And my professional email is #{email}.
    Member of #{Date.current.strftime('%m-%Y')}
    BIO
    my_str
  end
end
