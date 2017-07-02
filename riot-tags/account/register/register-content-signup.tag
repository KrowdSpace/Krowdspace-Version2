<register-content-signup>
    <div class="no-gutter register-background shadow">
        <div class="col-sm-5 register">
            <img class="img-responsive" src="/img/projects/krowdspace-register.png">
            <p class="text-center register-cta">Register your crowdfunding campaign and accelerate your growth today!</p>
        </div>
        <form class="col-sm-7" id="registerProjectForm" onsubmit={ submit }>
            <div class="registration-box shadow">
                <fieldset id="project_information">
                    <div class="form-group col-sm-12">
                        <p class="text-left registration-text">Do you own this crowdfunding project?</p>
                        <select ref="pvalid" type="text" class="form-control" name="projectOwner">
                            <option disabled selected value>Select Yes or No</option>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-12">
                        <p class="text-left registration-text">What category best fits your project?</p>
                        <select ref="category" type="text" class="form-control" name="projectCategory">
                            <option disabled selected value>Choose a Category</option>
                            <option value="art">Art</option>
                            <option value="design">Design</option>
                            <option value="film">Film</option>
                            <option value="food">Food</option>
                            <option value="music">Music</option>
                            <option value="photography">Photography</option>
                            <option value="technology">Technology</option>
                            <option value="videogames">Video Games</option>
                            <option value="publishing">Publishing</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-12 no-gutter">
                        <p class="text-left registration-text">Please provide your live crowdfunding project url.</p>
                        <div class="form-group col-sm-4 link-left">
                            <select ref="crowdportal" type="text" class="form-control" name="crowdSite">
                                <option disabled selected value>Choose Site</option>
                                <option value="https://www.kickstarter.com/">Kickstarter.com</option>
                                <option value="https://www.indiegogo.com/">Indiegogo.com</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-8 link-right">
                            <input ref="projecturl" type="text" class="form-control" name="projectLink" placeholder="/project/project-url">
                        </div>
                    </div>
                    <div class="register-controls text-center">
                        <p><a class="back-project next next-step">NEXT</a></p>
                    </div>
                </fieldset>
                <fieldset id="reward_information">
                    <div class="form-group col-sm-12">
                        <p class="text-left registration-text">Please provide an exclusive reward for our Krowdspace users.</p>
                        <input ref="rewardtext" class="form-control" name="reward" maxlength="80" placeholder="See Sample Rewards Below ( Max Characters 80 )">
                    </div>
                    <div class="form-group col-sm-12">
                        <p class="text-left registration-text">Does your reward have a value or is it a discount?</p>
                        <select ref="rewardoption" class="form-control" name="rewardValue">
                            <option disabled selected value>Choose an Option</option>
                            <option value="Yes">Reward has a Value</option>
                            <option value="No">Reward is a Discount</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-12">
                        <p class="text-left registration-text">Please estimate the value of your reward.</p>
                        <input ref="rewardvalue" class="form-control" name="rewardAmount">
                    </div>
                    <div class="register-controls">
                        <div class="col-lg-offset-3 col-lg-6">
                            <p class="pull-left"><a class="back-project previous">PREVIOUS</a></p>
                            <p class="pull-right"><a class="back-project next next-step">NEXT</a></p>
                        </div>
                    </div>
                </fieldset>
                <fieldset id="project_verify">
                    <div class="col-sm-12">
                        <p class="text-left registration-text">To verify that you are the crowdfunding project owner please upload one of these images to your project page before submitting it to Krowdspace. We will check to see if the image is present to prevent false project submissions. Thank you for your understanding!</p>
                    </div>
                    <div class="row text-center">
                        <img src="img/press/featured-krowdspace-v1.png" style="width: 400px;">
                    </div>
                    <div class="row text-center" style="margin-top: 13px;">
                        <img src="img/press/featured-krowdspace-v2.png" style="width: 70px;">
                        <img src="img/press/featured-krowdspace-v3.png" style="width: 90px; margin: 0px 50px;">
                        <img src="img/press/featured-krowdspace-v4.png" style="width: 70px;">
                    </div>
                    <div class="register-controls">
                        <div class="col-lg-offset-3 col-lg-6">
                            <p class="pull-left"><a class="back-project previous">PREVIOUS</a></p>
                            <p class="pull-right"><a class="back-project next next-step">NEXT</a></p>
                        </div>
                    </div>
                </fieldset>
                <fieldset id="service_terms">
                    <div class="col-sm-12">
                        <p class="text-left registration-text">TERMS AND CONDITIONS</p>
                        <p class="text-left registration-text">Krowdspace is not liable for any damages or losses related to using our services.</p>
                        <p class="text-left registration-text">Project owners are legally bound to fullfill any rewards promised to the Krowdspace user.</p>
                        <p class="text-left registration-text">Krowdspace is not responsible for the puncuality and delivery of the rewards and will not become involved between user disputes.</p>
                        <p class="text-left registration-text">Project owners are obligated to respond promptly and truthfully to all questions posed to them by Krowdspace or Krowdspace users.</p>
                    </div>
                    <div class="register-controls" >
                        <div class="col-lg-6 check-terms checkbox register-check">
                            <label>
                            <input type="checkbox" value="checked" name="serviceTerms" required minlength="1" aria-required="true"><span class="registration-text">I agree to <a href="#modal-service-terms" data-toggle="modal" class="home-links registration-text">Krowdspace terms</a></span>
                            </label>
                        </div>
                        <div class="col-sm-6">
                            <p class="pull-left"><a class="back-project previous">PREVIOUS</a></p>
                            <p class="pull-right"><input class="back-project" type="submit" value="SUBMIT" name="submit"></p>
                        </div>
                    </div>
                </fieldset>
            </div>
        </form>
        <div class="clearfix"></div>
    </div>
    <script>
        submit(e)
        {
            e.preventDefault();
        
            let PVALID = this.refs.pvalid.value,
                CATEGORY = this.refs.category.value,
                DOMAINURL = this.refs.crowdportal.options[this.refs.crowdportal.selectedIndex].value,
                URL =  this.refs.projecturl.value,
                REWARD = this.refs.rewardtext.value,
                REWARDVALUE = this.refs.rewardoption.value,
                REWARDAMOUNT = this.refs.rewardvalue.value;
    
            let DATA = {
                        PVALID,
                        CATEGORY,
                        DOMAINURL,
                        URL,
                        REWARD,
                        REWARDVALUE,
                        REWARDAMOUNT,
                        };
        
            krowdspace.register.project(DATA).then
            ((res) =>
                {
                console.log('Project Submission Successful');
                window.location.replace("/#/account/dashboard");  
                },
            (err) =>
                {
                $('#modal-project-error').modal('show');
                console.log(err);
                });
        }

    this.on('mount', function() 
        {
        	$(".next").click(function(){
        		var form = $("#registerProjectForm");
        		form.validate({
        			errorElement: 'span',
        			errorClass: 'help-block',
        			highlight: function(element, errorClass, validClass) {
        				$(element).closest('.form-group').addClass("has-error");
        			},
        			unhighlight: function(element, errorClass, validClass) {
        				$(element).closest('.form-group').removeClass("has-error");
        			},
        			rules: {
        				projectOwner: {
        					required: true,
        				},
        				projectCategory : {
        					required: true,
        				},
        				crowdSite : {
        					required: true,
        				},
        				projectLink:{
        					required: true,
        				},
        				reward:{
        					required: true,
        				},
        				rewardValue: {
        					required: true,
                            
        				},
        				rewardAmount: {
        					required: true,
                          number: true,
        				},
                      serviceTerms: {
        					required: true,
        				},
        				
        			},
        			messages: {
        				projectOwner: {
        					required: "",
        				},
        				projectCategory : {
        					required: "",
        				},
        				crowdSite : {
        					required: "",
        				},
        				projectLink: {
        					required: "",
        				},
        				reward: {
        					required: "",
        				},
                      rewardValue: {
        					required: "",
        				},
                      rewardAmount: {
        					required: "",
        				},
                      serviceTerms: {
        					required: "",
        				},
        			}
        		});
        		if (form.valid() === true){
        			if ($('#project_information').is(":visible")){
        				current_fs = $('#project_information');
        				next_fs = $('#reward_information');
        			}else if($('#reward_information').is(":visible")){
        				current_fs = $('#reward_information');
        				next_fs = $('#project_verify');
        			}else if($('#project_verify').is(":visible")){
        				current_fs = $('#project_verify');
        				next_fs = $('#service_terms');
        			}
        			
        			next_fs.show(); 
        			current_fs.hide();
        		}
        	});
        
        	$('.previous').click(function(){
        		if($('#reward_information').is(":visible")){
        			current_fs = $('#reward_information');
        			next_fs = $('#project_information');
        		}else if ($('#project_verify').is(":visible")){
        			current_fs = $('#project_verify');
        			next_fs = $('#reward_information');
        		}else if ($('#service_terms').is(":visible")){
        			current_fs = $('#service_terms');
        			next_fs = $('#project_verify');
        		}
        		next_fs.show(); 
        		current_fs.hide();
        	});
        });
    </script>
</register-content-signup>