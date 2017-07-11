<dashboard-explore-purchase>
    <div id="purchase-explore" class="modal container fade">
    <div class="krowdspace-modal col-sm-6 col-sm-offset-3">
        <div id="modal" class="modal-content">
            <div class="modal-header" style="padding-bottom: 0px;">
                <button type="button" class="close btn-modal" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x fa-times text-primary" aria-hidden="true"></i></button>
                <p class="modal-heading">Explore Page Banner</p>
                <p class="registration-text text-left edit-text-title" style="margin-top: 15px;">Your project will be listed on our Explore Page rotating banner. Having your project on our rotating banner will increase viewership. For a limited time we are offering this as a free service while we work through our initial launch! Please click the Upgrade button below to add this feature.</p>
                
            </div>
            
            <div class="modal-body">
                <form id="submitReward" role="form" onsubmit={ submitExplore }>
                    <div class="text-center update-modal-btn">
                        <button id="submit" type="submit" name="submit"  class="btn-register btn-info-full next-step">Upgrade</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="background-modal-close" data-dismiss="modal"> </div>
<script>
   this.on('update', ()=>
    {
        if(!opts.project)
            return;

        let res = {data: [opts.project]};
    });
    
    submitExplore(e) 
    {
        e.preventDefault();

        if(!opts.project)
            return;

        let userRes = {data: opts.user}
            projRes = {data: [opts.project]};

        this.setUserDeets(userRes, projRes);

    }; 

    setUserDeets(res, pRes)
    {
        let project = pRes.data[0].name,
            projectData = 
            {
                project_data: 
                {
                    meta_data: 
                    {
                        explore : true,
                    }
                }
        };

        this.setProjDeets(project, projectData);
    }
    
    setProjDeets(project, projectData)
    {
        krowdspace.projects.set_project(project, projectData).then((res)=>
        {
            window.location.reload();
        });
    }
</script>
</dashboard-explore-purchase>