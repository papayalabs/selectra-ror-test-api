# README

Remember to run rake db:seed to populate users:

# rake db:seed

To Authenticate add HEADER:

# X-API-Token: 111111

Create Provider:
# POST api/v1/providers?name=Telefonica

Read Provider:
# GET api/v1/providers/:id

Update Provider:
# PUT api/v1/providers/:id?name=Endesa

Delete Provider:
# DELETE api/v1/providers/:id

Create a Pixel for a given Provider( 2 endpoints ):
# POST api/v1/tracking_pixels?name=Pixel1&provider_id=1
# POST api/v1/providers/1/create_tracking_pixel?name=Pixel1

Mark Pixel as Converted:
# PUT api/v1/tracking_pixels/:tracking_pixel_id/converted