myData() ->
  series1 = []
  for i in range 100
    series1.push(x: i, y: 100 / i)

  return [
    key: "series #1",
    values: series1,
    color: "#0000ff"
  ]

nv.addGraph( ->
 chart = nv.models.lineChart()

 chart.xAxis
      .axisLabel "X-axis lable"

 chart.yAxis
        .axisLabel "Y-axis label"
        .tickFormat(d3.format("d"))

 d3.select("svg")
   .datum(myData())
   .transition().duration(500).call(chart)

 nv.utils.windowResize( ->
   chart.update())

 return chart
)