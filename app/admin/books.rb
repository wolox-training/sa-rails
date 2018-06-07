# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :genre, :author, :image, :title, :publisher, :year

  form do |f|
    f.inputs do
      f.input :genre, as: :string
      f.input :author, as: :string
      f.input :image, as: :string
      f.input :title, as: :string
      f.input :publisher, as: :string
      f.input :year, as: :string
    end
    f.actions
  end
end
