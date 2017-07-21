<dashboard-project-image>
<style>
@media screen and (max-width: 1200px) {
        .image-container {
            height: 242px;
        }
        .fixed-image-box {
            height: 220px;
        }
    }
@media screen and (max-width: 991px) {
        .image-container {
            height: 360px;
            border-right: 1px solid #3f434f;
        }
        .fixed-image-box {
            height: 340px;
        }
    }
@media screen and (max-width: 767px) {
        .image-container {
            height: auto;
            margin-left: auto;
            margin-right: auto;
            width: 400px;
        }
        .fixed-image-box {
            height: auto;
            margin-left: auto;
            margin-right: auto;
            min-height: 100px;
            width: 398px;
        }
    }
</style>
    <div class="col-md-6 image-container">
        <div class="fixed-image-box"> 
            <img show={ imagebox } class="img-responsive kickstarter-image" ref="kickstarterImage" src=""/>
            <img show={ !imagebox } class="img-responsive indiegogo-image" ref="indiegogoImage" src=""/>
            <p class="funding-text-left text-left">$ { dataBacked } RAISED</p>
            <p class="funding-text-right text-right">$ { dataGoal } GOAL</p>
        </div>
        <div id="progressBar"></div>
    </div>
<script>
    this.progBar = null;

    this.on('update', ()=> 
    {
        if(!opts.project)
            return;

        let platform = opts.project.platform;

        if (platform == 'kickstarter') 
        {
            imagebox = true;
            console.log('Kickstarter Image');
            this.refs.kickstarterImage.src = opts.project.project_data.web_data.mainImg.content;
        }else{
            imagebox = false;
            console.log('Indiegogo Image');
            this.refs.indiegogoImage.src = opts.project.project_data.web_data.mainImg.content;
        }; 

        let goalValue = opts.project.project_data.meta_data.funding,
            goalNumber = parseFloat(goalValue.replace(/,/g, '')),

            percentValue = opts.project.project_data.meta_data.raisedPercent,
            numberMax = Math.min(Math.max(percentValue, 0), 1),

            raisedRawNumber = goalNumber * percentValue,
            raisedNumber = Math.round(raisedRawNumber),
            raisedValue = raisedNumber.toLocaleString(),

            raisedvalue = opts.project.project_data.web_data.stats['data-percent-raised'],
            rawdecimal = Number.parseFloat(raisedvalue);

            this.dataBacked = raisedValue;
            this.dataGoal = goalValue;

            let bar = null;

            if(!this.progBar)
                this.progBar = bar = new ProgressBar.Line(progressBar, 
                {
                    strokeWidth: 4,
                    easing: 'easeInOut',
                    duration: 1400,
                    color: '#fed136',
                    trailColor: '#eee',
                    trailWidth: 4,
                    svgStyle: {width: '100%', height: '100%'}
                });
            else
                bar = this.progBar;
            
            bar.animate(numberMax);  // Number from 0.0 to 1.0
    });
</script>
</dashboard-project-image>	
	