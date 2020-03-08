ActiveAdmin.register Tracker do
  permit_params :count, :referrer, :size
end
