class RenameColumnAuthTokenInSessionsToAuthenticationDigest < ActiveRecord::Migration[5.0]
  def change
    rename_column :sessions, :auth_token, :authentication_digest
  end
end
