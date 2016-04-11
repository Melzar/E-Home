class AddRoleRelationToUserAndRemoveColumns < ActiveRecord::Migration
  def change

    remove_columns :users, :first_name, :last_name, :addres, :address_2, :city, :zip_code

    add_reference :users, :role, index: true
    add_foreign_key :users,
                    :roles,
                    foreign_key: true,
                    name: 'Users_Roles_Foreign_Key'
  end
end
