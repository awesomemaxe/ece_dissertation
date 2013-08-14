json.array!(@diss_trackers) do |diss_tracker|
  json.extract! diss_tracker, :UID, :last_name, :first_name, :titile, :chair, :advisor, :reader2, :reader3, :reader4, :reader5, :data_approved
  json.url diss_tracker_url(diss_tracker, format: :json)
end
