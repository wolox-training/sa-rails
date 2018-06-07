# frozen_string_literal: true

ActiveAdmin.register Rent do
  permit_params :user, :book, :from, :to

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map { |u|
        ["#{u.first_name}, #{u.last_name}", u.id]
      }
      f.input :book, as: :select, collection: Book.all
      f.input :from, as: :datepicker, datepicker_options: {
        min_date: Date.current.to_s
      }
      f.input :to, as: :datepicker, datepicker_options: {
        min_date: :from
      }
    end
    f.actions
  end
end
