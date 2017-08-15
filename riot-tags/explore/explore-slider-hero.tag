<explore-slider-hero>
    <style type="text/css">
        .landing-banner {
            height:310px;
            overflow: hidden;
            width: 550px; 
            background-color: #000; 
            position: relative;
            border-top:1px solid #000;
            border-bottom:1px solid #000;
        }
        .landing-slider {
            height: auto;
            margin-left: auto;
            margin-right: auto;
        }
        .indiegogo-image-small {
            height:310px;
            width: auto;
        }
    @media screen and (max-width: 550px) {
        .col-xs-9 {
            width: 90%;
        }
        .col-xs-3 {
            width: 10%;
        }
        .landing-banner {
            height:225px;
        }
        .indiegogo-image-small {
            height:225px;
            width: auto;
        }
        .landing-banner {
            width: 400px; 
            background-color: #000; 
            position: relative;
        }
    }
</style>
    <div class="row">
        <div class="autoplay slider explore-header">
            <div class="landing-banner" each= { ExploreBannerFilter }>
                <img class="landing-slider { project_data.meta_data.mainImg || 'indiegogo-image-small' }" src="{ project_data.meta_data.mainImg || project_data.meta_data.altImg }" alt="{ name }">
                <div class="landing-banner-box">
                    <div class="col-xs-9 padding-reset">
                        <span class="explore-title">{ name }</span>
                        <div class="explore-box-text">
                            <span class="explore-title">{ project_data.info_data.reward }</span>
                        </div>
                    </div>
                    <div class="col-xs-3 learn-more-box text-right">
                        <a class="plus-switch-one" href="{ unique_url || '/#/explore/project/' + unique_id }" data-toggle="modal"><p class="learn-more">Learn More</p></a>
                        <a class="plus-switch" href="{ unique_url || '/#/explore/project/' + unique_id }" data-toggle="modal"><i class="fa fa-plus learn-more-plus"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        krowdspace.projects.explore().then((res) =>
        {
            let ExploreBannerData = res.data;
            
                FilterExplore = ExploreBannerData.filter((element) => {
                return (element.project_data.info_data.explore);
            });

            let newObject={
                        unique_url: '#modal-feature-info',
                        name: '',
                        project_data: 
                        {
                            info_data: 
                            {
                                reward: ''
                            },
                            meta_data: 
                            {
                                mainImg: '/img/content/krowdspace-banner-1.jpg',
                            },
                        },
                    };
            let newObject2={
                        unique_url: '#modal-global-register',
                        name: 'Join Krowdspace Today!',
                        project_data: 
                        {
                            info_data: 
                            {
                                reward: 'Discover Extra Rewards For Projects You Love!'
                            },
                            meta_data: 
                            {
                                mainImg: '/img/content/krowdspace-join.jpg',
                            },
                        },
                    };

            FilterExplore.unshift(newObject, newObject2);
            FilterExplore.reverse(); 
            this.ExploreBannerFilter = FilterExplore;
            this.update();

            $('.autoplay').slick
            ({
                arrows: false,
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 5000,
                centerMode: true,
                variableWidth: true,
            });
        },
        (err)=>
        {
            let FilterExplore = [];
            let newObject={
                        unique_url: '#modal-feature-info',
                        name: '',
                        project_data: 
                        {
                            info_data: 
                            {
                                reward: ''
                            },
                            meta_data: 
                            {
                                mainImg: '/img/content/krowdspace-banner-1.jpg',
                            },
                        },
                    };
            let newObject2={
                        unique_url: '#modal-global-register',
                        name: 'Join Krowdspace Today!',
                        project_data: 
                        {
                            info_data: 
                            {
                                reward: 'Discover Extra Rewards For Projects You Love!'
                            },
                            meta_data: 
                            {
                                mainImg: '/img/content/krowdspace-join.jpg',
                            },
                        },
                    };

            FilterExplore.unshift(newObject, newObject2);
            FilterExplore.reverse(); 
            this.ExploreBannerFilter = FilterExplore;
            this.update();

            $('.autoplay').slick
            ({
                arrows: false,
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 5000,
                centerMode: true,
                variableWidth: true,
            });
        });
    </script>
</explore-slider-hero>
