am4core.useTheme(am4themes_animated);

var insterfaceColors = new am4core.InterfaceColorSet();
var lineColor = insterfaceColors.getFor("background");

var chart = am4core.create("chartdiv", am4plugins_timeline.CurveChart);
chart.curveContainer.padding(20,20,20,20);

chart.data = [{ name: "Chandler", file: "chandler.jpg", track: 1, value: 450 }, { name: "Ross", file: "ross.jpg", track: 2, value: 650 }, { name: "Joey", file: "joey.jpg", track: 3, value: 578 }, { name: "Monica", file: "monica.jpg", track: 4, value: 730 }, { name: "Phoebe", file: "phoebe.jpg", track: 5, value: 490 }, { name: "Rachel", file: "rachel.jpg", track: 6, value: 532 }];

var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "name";
categoryAxis.renderer.minGridDistance = 10;
categoryAxis.renderer.innerRadius = 5;
categoryAxis.renderer.radius = 145;
categoryAxis.renderer.line.stroke = lineColor;
categoryAxis.renderer.line.strokeWidth = 5;
categoryAxis.renderer.line.strokeOpacity = 1;

var labelTemplate = categoryAxis.renderer.labels.template;
labelTemplate.fill = lineColor;
labelTemplate.fontWeight = 600;
labelTemplate.fontSize = 11;

var gridTemplate = categoryAxis.renderer.grid.template;
gridTemplate.strokeWidth = 1;
gridTemplate.strokeOpacity = 1;
gridTemplate.stroke = lineColor;
gridTemplate.location = 0;
gridTemplate.above = true;

var fillTemplate = categoryAxis.renderer.axisFills.template;
fillTemplate.disabled = false;
fillTemplate.fill = am4core.color("#b84f49");
fillTemplate.fillOpacity = 1;

categoryAxis.fillRule = function(dataItem) {
    dataItem.axisFill.__disabled = false;
    dataItem.axisFill.opacity = 1;
}

var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.max = 1000;
valueAxis.renderer.points = [{ x: 0, y: -100 }, { x: 200, y: -100 }, { x: 200, y: 100 }, { x: 0, y: 100 }, { x: -200, y: 100 }, { x: -200, y: -100 }, { x: 0, y: -100 }];
valueAxis.renderer.polyspline.tensionX = 0.4;
valueAxis.renderer.line.strokeOpacity = 0.1;
valueAxis.renderer.line.strokeWidth = 10;
valueAxis.renderer.maxLabelPosition = 0.98;
valueAxis.renderer.minLabelPosition = 0.02;

// Flag bullet
var flagRange = valueAxis.axisRanges.create();
flagRange.value = 0;
var flagBullet = new am4plugins_bullets.FlagBullet();
flagBullet.label.text = "START";
flagRange.bullet = flagBullet;
//flagBullet.dy = -145;
flagBullet.adapter.add("dy", function (dy, target) {
    return -categoryAxis.renderer.radius;
})

var valueLabelTemplate = valueAxis.renderer.labels.template;
valueLabelTemplate.fill = lineColor;
valueLabelTemplate.fontSize = 8;
valueLabelTemplate.fontWeight = 600;
valueLabelTemplate.fillOpacity = 1;
valueLabelTemplate.horizontalCenter = "right";
valueLabelTemplate.verticalCenter = "bottom";
valueLabelTemplate.padding(0, 10, 0, 0);
valueLabelTemplate.adapter.add("rotation", function (rotation, target) {
    var value = target.dataItem.value;
    var position = valueAxis.valueToPosition(value);

    var angle = valueAxis.renderer.positionToAngle(position);
    return angle;
})

var valueGridTemplate = valueAxis.renderer.grid.template;
valueGridTemplate.strokeOpacity = 0.3;
valueGridTemplate.stroke = lineColor;


// SERIES
var series = chart.series.push(new am4plugins_timeline.CurveColumnSeries());
series.dataFields.categoryY = "name";
series.stroke = lineColor;
series.fill = lineColor;
series.dataFields.valueX = "value";
series.defaultState.transitionDuration = 4000;

var columnTemplate = series.columns.template;
columnTemplate.fill = lineColor;
columnTemplate.strokeOpacity = 0;
columnTemplate.fillOpacity = 0.3;
columnTemplate.height = am4core.percent(100);

var hoverState = columnTemplate.states.create("hover");
hoverState.properties.fillOpacity = 0.9;

var bullet = series.bullets.push(new am4charts.CircleBullet())
bullet.fill = lineColor;

// LEGEND
chart.legend = new am4charts.Legend();
chart.legend.data = chart.data;
chart.legend.parent = chart.curveContainer;
chart.legend.width = 360;
chart.legend.horizontalCenter = "middle";
chart.legend.verticalCenter = "middle";

var markerTemplate = chart.legend.markers.template;
markerTemplate.width = 30;
markerTemplate.height = 30;

chart.legend.itemContainers.template.events.on("over", function (event) {
    series.dataItems.each(function (dataItem) {
        if (dataItem.dataContext == event.target.dataItem.dataContext) {
            dataItem.column.isHover = true;
        }
        else {
            dataItem.column.isHover = false;
        }
    })
})

chart.legend.itemContainers.template.events.on("hit", function (event) {
    series.dataItems.each(function (dataItem) {
        if (dataItem.dataContext == event.target.dataItem.dataContext) {
            if (dataItem.visible) {
                dataItem.hide(1000, 0, 0, ["valueX"]);
            }
            else {
                dataItem.show(1000, 0, ["valueX"]);
            }
        }
    })
})

var rect = markerTemplate.children.getIndex(0);
rect.cornerRadius(20, 20, 20, 20);

var as = markerTemplate.states.create("active");
as.properties.opacity = 0.5;

var image = markerTemplate.createChild(am4core.Image)
image.propertyFields.href = "file";
image.width = 30;
image.height = 30;
image.filters.push(new am4core.DesaturateFilter());

image.events.on("inited", function (event) {
    var image = event.target;
    var parent = image.parent;
    image.mask = parent.children.getIndex(0);
})