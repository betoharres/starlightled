//=require amcharts/amcharts.js
//=require amcharts/serial.js
//=require amcharts/amstock.js

var chartData = $('#chart-temp-data').data('device');

// use UTC time
AmCharts.useUTC = true;

var chart = AmCharts.makeChart("chartdiv", {
    type: "stock",
      "theme": "light",
      pathToImages: "http://www.amcharts.com/lib/3/images/",
      categoryAxesSettings: {
        minPeriod: "mm",
        dataDateFormat: 'YYYY-MM-DD JJ:NN:SS',
        // parseDates: true
      },
      language: 'pt',

    dataSets: [{
      title: "Temperatura LED 1",
      color: ['#0099CC'],
        fieldMappings: [{
          fromField: "tLed1",
          toField: "value"
        }, {
          fromField: "pwr",
          toField: "volume"
        }],
        dataProvider: chartData,
        categoryField: "date"
      },

      {
        title: "Temperatura LED 2",
        color: '#DB4949',
        fieldMappings: [{
          fromField: "tLed2",
          toField: "value"
        }, {
          fromField: "pwr",
          toField: "volume"
        }],
        dataProvider: chartData,
        categoryField: "date"
      },

      {
        title: "Temperatura Fonte",
        fieldMappings: [{
          fromField: "tCom",
          toField: "value"
        }, {
          fromField: "pwr",
          toField: "volume"
        }],
        dataProvider: chartData,
        categoryField: "date"
      }
    ],

    panels: [{

        showCategoryAxis: true,
        title: "Temperatura",
        recalculateToPercents: 'never',
        percentHeight: 70,

        stockGraphs: [{
          id: "g1",

          valueField: "value",
          lineThickness: 1.5,
          comparable: true,
          compareField: "value",
          balloonText: "<i class=\"wi wi-thermometer-exterior\"></i> [[title]]: <b>[[value]]</b> °C",
          compareGraphBalloonText: "<i class=\"wi wi-thermometer-exterior\"></i> [[title]]: <b>[[value]]</b> °C"
        }],

        stockLegend: {
          periodValueTextComparing: "[[value.close]]",
          periodValueTextRegular: "[[value.close]]",
          position: 'top'
        },
      // categoryAxis: {
      //     labelFunction: function (valueText, value, valueAxis) {
      //         // recalculate to EST (-5 hours)
      //         var est = new Date(value);
      //         est.setHours(est.getHours()-3);
      //         return AmCharts.formatDate(est, "HH:NN");
      //     }
      //   }
      },
      {
        title: "Consumo",
        percentHeight: 20,
        stockGraphs: [{
          valueField: "volume",
          // periodValue: 'Average',
          type: "smoothedLine",
          balloonText: "<i class=\"fa fa-bolt\"></i> [[value]] W",
          showBalloon: true,
          fillAlphas: 1
        }],
        stockLegend: {
          periodValueTextRegular: "[[pwr]]"
        },
      }
    ],

    chartScrollbarSettings: {
      graph: "g1"
    },

    chartCursorSettings: {
      valueBalloonsEnabled: true,
          fullWidth:true,
          cursorAlpha:0.1,
          valueLineBalloonEnabled:true,
          valueLineEnabled:false,
          valueLineAlpha:0.5
    },

    periodSelector: {
      dateFormat: "DD/MM/YYYY JJ:NN",
      inputFieldWidth: 150,
      position: "bottom",
      periods: [{
        period: "hh",
        selected: true,
        count: 48,
        label: "48 horas"
      },
      {
        period: "DD",
        count: 6,
        label: "1 Semana"
      }]
    },

    dataSetSelector: {
      position: "top"
    }
  });
