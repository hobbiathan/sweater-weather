require 'rails_helper'
require './app/poros/photo'

RSpec.describe 'Photo PORO' do
  before(:each) do
    @data = {:id=>"zSm5JPgNeuc",
 :created_at=>"2021-08-16T21:22:29-04:00",
 :updated_at=>"2022-04-24T12:24:06-04:00",
 :promoted_at=>"2022-02-24T20:24:02-05:00",
 :width=>4392,
 :height=>6588,
 :color=>"#d9c0c0",
 :blur_hash=>"LaJ@:y%2%fWB~q%2IoaxE1f7M{WV",
 :description=>"Boho Girl\n\nModel : @peanutphysique",
 :alt_description=>"woman in white tank top sitting on brown wooden chair",
 :urls=>
  {:raw=>
    "https://images.unsplash.com/photo-1629163330223-c183571735a1?ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NTA4NzYwMzY&ixlib=rb-1.2.1",
   :full=>
    "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NTA4N
zYwMzY&ixlib=rb-1.2.1&q=85",
   :regular=>
    "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwf
Hx8fDE2NTA4NzYwMzY&ixlib=rb-1.2.1&q=80&w=1080",
   :small=>
    "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwf
Hx8fDE2NTA4NzYwMzY&ixlib=rb-1.2.1&q=80&w=400",
   :thumb=>
    "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwf
Hx8fDE2NTA4NzYwMzY&ixlib=rb-1.2.1&q=80&w=200",
   :small_s3=>"https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1629163330223-c183571735a1"},
 :links=>
  {:self=>"https://api.unsplash.com/photos/zSm5JPgNeuc",
   :html=>"https://unsplash.com/photos/zSm5JPgNeuc",
   :download=>"https://unsplash.com/photos/zSm5JPgNeuc/download?ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NTA4NzYwMzY",
   :download_location=>"https://api.unsplash.com/photos/zSm5JPgNeuc/download?ixid=MnwzMjI1Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NTA4NzYwMzY"},
 :categories=>[],
 :likes=>70,
 :liked_by_user=>false,
 :current_user_collections=>[],
 :sponsorship=>nil,
 :topic_submissions=>{:spirituality=>{:status=>"approved", :approved_on=>"2022-02-25T12:59:43-05:00"}},
 :user=>
  {:id=>"FZ9entlYhv0",
   :updated_at=>"2022-04-25T00:12:00-04:00",
   :username=>"tayloradaugherty",
   :name=>"Taylor Daugherty",
   :first_name=>"Taylor",
   :last_name=>"Daugherty",
   :twitter_username=>nil,
   :portfolio_url=>"http://taylordaugherty.com",
   :bio=>"IG: Tayloradaugherty",
   :location=>"Saint Petersburg, Florida",
   :links=>
    {:self=>"https://api.unsplash.com/users/tayloradaugherty",
     :html=>"https://unsplash.com/@tayloradaugherty",
     :photos=>"https://api.unsplash.com/users/tayloradaugherty/photos",
     :likes=>"https://api.unsplash.com/users/tayloradaugherty/likes",
     :portfolio=>"https://api.unsplash.com/users/tayloradaugherty/portfolio",
     :following=>"https://api.unsplash.com/users/tayloradaugherty/following",
     :followers=>"https://api.unsplash.com/users/tayloradaugherty/followers"},
   :profile_image=>
    {:small=>"https://images.unsplash.com/profile-1629165748557-ebeca78a15c3image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
     :medium=>"https://images.unsplash.com/profile-1629165748557-ebeca78a15c3image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
     :large=>"https://images.unsplash.com/profile-1629165748557-ebeca78a15c3image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
   :instagram_username=>"tayloradaugherty",
   :total_collections=>0,
   :total_likes=>0,
   :total_photos=>64,
   :accepted_tos=>true,
   :for_hire=>true,
   :social=>{:instagram_username=>"tayloradaugherty", :portfolio_url=>"http://taylordaugherty.com", :twitter_username=>nil, :paypal_email=>nil}},
 :tags=>[{:type=>"search", :title=>"co"}, {:type=>"search", :title=>"denver"}, {:type=>"search", :title=>"usa"}]}


    @photoPoro = PhotoPoro.new(@data)
  end

  it 'exists' do
    expect(@photoPoro).to be_a(PhotoPoro)
  end

  it 'contains respective attributes' do
    expect(@photoPoro.id).to eq(@data[:id])
    expect(@photoPoro.source).to eq("unsplash.com")
    expect(@photoPoro.image_url).to eq(@data[:urls][:regular])
    expect(@photoPoro.photographer).to eq(@data[:user][:name])
    expect(@photoPoro.profile).to eq(@data[:user][:portfolio_url])
  end
end
