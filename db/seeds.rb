User.create!([
  {email: "admin@rent.com", encrypted_password: "$2a$10$R78flKC10.R.kp5Yj5F6HujmmNdCMHW6NdFKT7MEwXHFVt1UoN.bS", confirmation_token: nil, remember_token: "a2823055792c07534b8d702f1308a0696ca64c92"}
])
Bike.create!([
  {bike_type: "City Bike", description: "3 gear regular bike", image_url: "Citybike.jpg", cost_per_hour: 2, day_rate: 5, weekend_rate: 15, avail: false, qty: 0, location: "Connolly Station"},
  {bike_type: "Fold up Bike", description: "3 gear fold up bike,folds in half and can remove wheels for easy storage at the office.", image_url: "Foldupbike.jpg", cost_per_hour: 4, day_rate: 10, weekend_rate: 20, avail: false, qty: 0, location: "Stephen's Green beside Luas"},
  {bike_type: "Hybrid Bike", description: "Bike with a electic motor for those who are less energetic", image_url: "Hybridbike.jpg", cost_per_hour: 5, day_rate: 10, weekend_rate: 20, avail: true, qty: 4, location: "O'Connell St"},
  {bike_type: "Mountain bike", description: "Super strong mountain bike.Ideal for rough tourain and at weekends", image_url: "Mountainbike.jpg", cost_per_hour: 4, day_rate: 10, weekend_rate: 20, avail: false, qty: 5, location: "Sandyford Luas St"},
  {bike_type: "Road Bike", description: "5 speed road bike,move swiftly around town.", image_url: "Roadbike.jpg", cost_per_hour: 3, day_rate: 8, weekend_rate: 16, avail: true, qty: 5, location: "Temple Bar"},
  {bike_type: "Tandem bike", description: "Leasurly tandem bike for fun in the parks", image_url: "Tandembike.png", cost_per_hour: 5, day_rate: 15, weekend_rate: 20, avail: false, qty: 0, location: "Marley Park"},
  {bike_type: "Vintage bike", description: "Experience the past with this revamped vintage model.", image_url: "Vintagebike.png", cost_per_hour: 10, day_rate: 20, weekend_rate: 30, avail: false, qty: 0, location: "Stephen's Green beside Luas"}
])
