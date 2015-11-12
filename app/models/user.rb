class User
  def self.update_coordinates(latitude, longitude, email, token)
    response = HTTParty.post(
      "#{ENV['SERVER_URL']}/users/update_coordinates.json?user_email=#{email}&user_token=#{token}",
      format: :json,
      body: {
        latitude: latitude,
        longitude: longitude
      }
    )

    response
  end

  def self.wags(email, auth_token)
    response = HTTParty.get(
      "#{ENV['SERVER_URL']}/api/v1/wags.json?user_email=#{email}&user_token=#{auth_token}"
    )

    response['wags']
  end

  def self.sign_in(email, password)
    HTTParty.post(
      "#{ENV['SERVER_URL']}/api/v1/users/sign_in.json",
      format: :json,
      body: {
        user: {
          email: email,
          password: password
        }
      }
    )
  end

  def self.sign_up(params)
    username = params[:username]
    email = params[:email]
    password = password_confirmation = params[:password]
    zipcode = params[:zipcode]

    HTTParty.post(
      "#{ENV['SERVER_URL']}/api/v1/users.json",
      format: :json,
      body: {
        user: {
          username: username,
          email: email,
          password: password,
          password_confirmation: password_confirmation,
          zipcode: zipcode
        }
      }
    )
  end
end