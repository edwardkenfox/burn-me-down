drawChart = ->
  data = google.visualization.arrayToDataTable([
    [
      "日"
      "理想"
      "現実"
    ]
    [
      "12/31"
      100
      110
    ]
    [
      "01/01"
      90
      105
    ]
    [
      "01/02"
      80
      98
    ]
    [
      "01/03"
      70
      98
    ]
    [
      "01/04"
      60
      97
    ]
    [
      "01/05"
      50
      96
    ]
    [
      "01/06"
      40
      96
    ]
    [
      "01/07"
      30
      60
    ]
    [
      "01/08"
      20
      48
    ]
    [
      "01/09"
      10
      30
    ]
    [
      "01/10"
      0
      20
    ]
  ])
  options =
    title: ""
    hAxisme:
      title: "日時"
      titleTextStyle:
        color: "#333"

    vAxis:
      minValue: 0

  chart = new google.visualization.AreaChart(document.getElementById("chart_div"))
  chart.draw data, options
  return
google.load "visualization", "1",
  packages: ["corechart"]

google.setOnLoadCallback drawChart
