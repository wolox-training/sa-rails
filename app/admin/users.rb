# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :locale

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :updated_at
    column :locale
    actions
  end

  form do |f|
    f.inputs do
      f.input :email, as: :string
      f.input :password, as: :string
      f.input :password_confirmation, as: :string
      f.input :first_name, as: :string
      f.input :last_name, as: :string
      f.input :locale, as: :string
    end
    f.actions
  end
end
