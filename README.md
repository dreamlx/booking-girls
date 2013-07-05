# todo
add profile
add avatar
change upload file_field
support progressbar for uploading

整理task逻辑
整理后台逻辑

#story
users can see all pic

#paginate css style
    http://mislav.uniqpath.com/will_paginate/

## act_as_rateable

    # rate for selected post
    @post.rate_it( 4, current_user ) #=> true || false

    # average rating of selected post
    @post.average_rating #=> 4.0
    @post.average_rating_round #=> 4
    @post.average_rating_percent #=> 80

    # check if selected post rated by user
    @post.rated_by?( current_user ) #=> instance of rating model || false

    @post.parse_ratings(:json) #=> JSON formatted string containing the post's ratings

    # find posts with rating '4'
    Post.find_average_of( 4 ) #=> array