# README

Remember to run:

rake db:seed to populate users

To Authenticate add HEADER:

X-API-Token: 111111

Create Provider:
# POST api/v1/providers?name=Telefonica

Read Provider:
# GET api/v1/providers/:id

Update Provider:
# PUT api/v1/providers/:id?name=Endesa

Delete Provider:
# DELETE api/v1/providers/:id

Mark Pixel as Converted:
# PUT api/v1/tracking_pixels/:tracking_pixel_id/converted