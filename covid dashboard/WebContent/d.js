
 





var viz;

function refreshThatSucker(){
	viz.refreshDataAsync();
	//or do something more obvious and evil
	//viz.showShareDialog();
}


function initViz() {
    var containerDiv = document.getElementById("cont"),
    url = "https://prod-apnortheast-a.online.tableau.com/t/vineela/views/final/Dashboard1/vineelamvmp@gmail.com/13c4c114-2881-4793-a504-250837af8aa8?:display_count=n&:showVizHome=n&:origin=viz_share_link";
    const options= {
	height:"6900px",
	width:"1500px",
	hideTabs:true,
	hideToolbar:true,
        onFirstInteractive: function () {
	  // Refresh the viz every 5000 milliseconds
	  window.setInterval("refreshThatSucker()",60000);
        }
     };

  
      viz = new tableau.Viz(containerDiv, url, options);
   
}