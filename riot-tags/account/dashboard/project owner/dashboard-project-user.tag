<dashboard-project-user>
    <div class="col-md-6 text-left no-gutter project-page-container" style="padding-left: 0px; padding-right: 0px;">
        <a href="#edit-profile" class="modal-link" data-toggle="modal">
            <span class="fa-stack fa-lg social-btn filterdark float-btn">
            <i class="fa fa-circle fa-stack-2x"></i>
            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <p class="profile-name capital">{ firstname || 'Firstname' } { lastname || 'Lastname' }</p>
        <div class="col-sm-4 col-xs-5 user-profile-push">
                <p class="dashboard-user user-break">Username:</p>
        </div>
        <div class="col-sm-8 col-xs-7">
            <p class="dashboard-user user-break capital">{ username || 'Username' }</p>
        </div>
        <div class="col-sm-4 col-xs-5 user-profile-push">
                <p class="dashboard-user">Email:</p>
        </div>
        <div class="col-sm-8 col-xs-7">
            <p class="dashboard-user capital">{ email || 'Email Address' }</p>
        </div>
        <div class="col-sm-4 col-xs-5 user-profile-push">
                <p class="dashboard-user user-break hidden-md">Kickstarter Name:</p>
        </div>
        <div class="col-sm-8 col-xs-7">
            <p class="dashboard-user user-break hidden-md capital">{ kickstarter || 'N/A' }</p>
        </div>
        <div class="col-sm-4 col-xs-5 user-profile-push">
                <p class="dashboard-user hidden-md">Indiegogo Name:</p>
        </div>
        <div class="col-sm-8 col-xs-7">
            <p class="dashboard-user hidden-md capital">{ indiegogo || 'N/A' }</p>
        </div>

        <div class="user-position-box">
        <p class="dashboard-text profile-name">Project Status</p>
            <div class="col-xs-4 no-gutters text-center user-stat-box">
            <p class="dashboard-user user-text-alt">Raised Percent</p>
                <p class="social-metric">{ percentRaised || 0 }</p>
            </div> 
            <div class="col-xs-3 no-gutters text-center user-stat-box">
                <p class="dashboard-user user-text-alt">Hours Left</p>
                    <p class="social-metric">{ countdowntimer || 0 }</p>
            </div> 
            <div class="col-xs-4 no-gutters text-center user-stat-box">
                <p class="dashboard-user user-text-alt">Reward Value</p>
                    <p class="social-metric">{ rewardAmount || 0 }</p>
            </div> 
        </div>
        <!-- Saving this incase we want to use it for something else!
            <div class="col-xs-4 text-center divider-inside-right user-stat-box">
                <p class="dashboard-user">Current Project</p>
                <p class="social-metric">{ opts.index }</p>
            </div> 
        -->
        <div class="col-lg-12 approval-container">
            <a href="#project-status" class="modal-link" data-toggle="modal">
                <img show={ warning } class="project-approval" src="/img/content/returned-icon-vertical.svg" title="Project is pending approval and should be reviewed shortly.">
                <img show={ pending } class="project-approval" src="/img/content/warning-icon-vertical.svg" title="Project has been approved and is live on the Explore page.">
                <img show={ approved } class="project-approval" src="/img/content/approved-icon-vertical.svg" title="Project has been approved and is live on the Explore page.">
            </a>
        </div>
    </div>
    <script>
        this.on('update', ()=>
        {
            if(!opts.user) 
                return;

            let userRes = { data: opts.user },
                projRes = { data: [opts.project] };
        
            this.setUserDeets(userRes);
            if(opts.project)
                this.setProjectDeets(projRes);
        });
        
        setUserDeets(res)
        {
            this.firstname = res.data.user_data.fname;
            this.lastname = res.data.user_data.lname;
            this.email = res.data.email;
            this.kickstarter = res.data.user_data.ksuser;
            this.indiegogo = res.data.user_data.iguser;
            this.username = res.data.username;
        }
        
        setProjectDeets(res)
        {
            
            let percentRaised = res.data[0].project_data.meta_data.raisedPercent,
                endTime = res.data[0].project_data.meta_data.endTime,
                end = new Date(endTime),
                remaining = new Date( end.getTime() - ( new Date().getTime() ) ).getTime() / 3600000,
                daysMax = Math.max(0, remaining);
            this.countdowntimer = Math.floor(daysMax);

            this.rewardAmount = '$' + res.data[0].project_data.info_data.reward_ammount;

            let percent = res.data[0].project_data.meta_data.raisedPercent,
                whole = percent * 100,
                wholeRound = Math.round(whole);
            this.percentRaised = wholeRound + '%';


            if (res.data[0].project_data.info_data.rewardValid == 0) 
            {
                approved = false;
                pending = true;
                warning = false;

            }else if(res.data[0].project_data.info_data.rewardValid == 1 || 4)
            {
                approved = true;
                pending = false;
                warning = false;

            }else if(res.data[0].project_data.info_data.rewardValid == 2)
            {
                approved = false;
                pending = false;
                warning = true;
            }; 
        }
    </script>
</dashboard-project-user>