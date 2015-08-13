//=require amcharts/amcharts.js
//=require amcharts/serial.js
//=require amcharts/amstock.js
//=require amcharts/pt.js

var chartData = $('#chart-temp-data').data('device');

// use UTC time
AmCharts.useUTC = true;

var chart = AmCharts.makeChart("chartdiv", {
    type: "stock",
    theme: "light",
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


prog = {
	programacao:
	{
		versao: "1",
		planos:
		{
			dimerizacao: [],
			defasagem: [],
			desabilitarPerifericos:
			{
				placaLed1: [],
				placaLed2: [],
				temperaturaFonte: [],
				sensorLuminosidade: [],
				memoriaExterna: [],
				microcontroladorPlacaLed1: [],
				microcontroladorPlacaLed2: []
			}
		},
		trocas:
		{
			plano: [],
			modo: [],
			diasSemana:
			{
				domingo: [],
				segunda: [],
				terca: [],
				quarta: [],
				quinta: [],
				sexta: [],
				sabado: []
			},
			hora: [],
			minuto: [],
			segundo: [],
			diaMes: [],
			mes: [],
			ano: []
		}
	}
};

var $plan = $('#panelPlans');
var $changes = $('#panelChanges');
var $change = [];
var LastPlan = $plan.find('#plan_id').val();

for(var i=1; i<=16; i++){
	$change[i] = $changes.find("#change_"+i);
}

function memo(elementId, $base){
	var $orig = $base.find('#'+elementId);
	if($orig.is(':checkbox')){
		return $orig.prop('checked');
	}
	else{
		return $orig.val();
	}
}

function restore(elementId, orig, $base){
	var $dest = $base.find('#'+elementId);
	if($dest.is(':checkbox')){
		$dest.prop('checked', (orig) ? true : false);
	}
	else{
		$dest.val( orig );
	}
}

function memoPlan ( p ){
	var o = prog.programacao.planos;
	var des = o.desabilitarPerifericos;
	
	o.dimerizacao[p] = memo( 'dimerization', $plan );
	o.defasagem[p] = memo( 'delay', $plan );
	des.placaLed1[p] = memo( 'sensor1', $plan );
	des.placaLed2[p] = memo( 'sensor2', $plan );
	des.temperaturaFonte[p] = memo( 'sensor3', $plan );
	des.sensorLuminosidade[p] = memo( 'sensor4', $plan );
	des.memoriaExterna[p] = memo( 'sensor5', $plan );
	des.microcontroladorPlacaLed1[p] = memo( 'sensor6', $plan );
	des.microcontroladorPlacaLed2[p] = memo( 'sensor7', $plan );
	
	o.desabilitarPerifericos = des;
	prog.programacao.planos = o;
}

function restorePlan( p ){
	var o = prog.programacao.planos;
	var des = o.desabilitarPerifericos;
	
	restore('dimerization', o.dimerizacao[p], $plan );
	restore('delay', o.defasagem[p], $plan );
	restore('sensor1', des.placaLed1[p], $plan );
	restore('sensor2', des.placaLed2[p], $plan );
	restore('sensor3', des.temperaturaFonte[p], $plan );
	restore('sensor4', des.sensorLuminosidade[p], $plan );
	restore('sensor5', des.memoriaExterna[p], $plan );
	restore('sensor6', des.microcontroladorPlacaLed1[p], $plan );
	restore('sensor7', des.microcontroladorPlacaLed2[p], $plan );
}

function memoChanges (){
	var o = prog.programacao.trocas;
	var str;
	
	for (var i = 1; i <= 16; i++) {
		str = 'change_' + i + '_';
		
		o.plano[i] = memo( str + 'plan', $change[i] );
		o.modo[i]  = memo( str + 'mode', $change[i] );
		
		o.diasSemana.domingo[i] = memo( str + 'sun', $change[i] );
		o.diasSemana.segunda[i] = memo( str + 'mon', $change[i] );
		o.diasSemana.terca[i]   = memo( str + 'tue', $change[i] );
		o.diasSemana.quarta[i]  = memo( str + 'wed', $change[i] );
		o.diasSemana.quinta[i]  = memo( str + 'thu', $change[i] );
		o.diasSemana.sexta[i]   = memo( str + 'fri', $change[i] );
		o.diasSemana.sabado[i]  = memo( str + 'sat', $change[i] );
		
		o.hora[i]    = memo(str + 'hour'   , $change[i] );
		o.minuto[i]  = memo(str + 'minute' , $change[i] );
		o.segundo[i] = memo(str + 'secound', $change[i] );
		o.diaMes[i]  = memo(str + 'day'    , $change[i] );
		o.mes[i]     = memo(str + 'month'  , $change[i] );
		o.ano[i]     = memo(str + 'year'   , $change[i] );
		
	}
	prog.programacao.trocas = o;
}

function restoreChanges (){
	var o = prog.programacao.trocas;
	var str;
	
	for (var i = 1; i <= 16; i++) {
		str = 'change_' + i + '_';
		
		restore(str + 'plan', o.plano[i], $change[i] );
		restore(str + 'mode', o.modo[i] , $change[i] );
		
		restore(str + 'sun', o.diasSemana.domingo[i], $change[i] );
		restore(str + 'mon', o.diasSemana.segunda[i], $change[i] );
		restore(str + 'tue', o.diasSemana.terca[i]  , $change[i] );
		restore(str + 'wed', o.diasSemana.quarta[i] , $change[i] );
		restore(str + 'thu', o.diasSemana.quinta[i] , $change[i] );
		restore(str + 'fri', o.diasSemana.sexta[i]  , $change[i] );
		restore(str + 'sat', o.diasSemana.sabado[i] , $change[i] );
		
		restore(str + 'hour'   , o.hora[i]   , $change[i] );
		restore(str + 'minute' , o.minuto[i] , $change[i] );
		restore(str + 'secound', o.segundo[i], $change[i] );
		restore(str + 'day'    , o.diaMes[i] , $change[i] );
		restore(str + 'month'  , o.mes[i]    , $change[i] );
		restore(str + 'year'   , o.ano[i]    , $change[i] );
		
	}
	toggleChanges();
}

function toggleChanges(){
	var $trocaAnterior=false;
	var mostrarTodos = false;
	var $esp;
	for(var i=16; i>0; i--){
		if($trocaAnterior){
			if(mostrarTodos || $change[i].find(".week-control input:checked").not("[id$='_all']").length>0){
				mostrarTodos = true;
				$trocaAnterior.show();
				$esp = $change[i].find("#change_"+i+"_especial_date");
				if($esp.is(':checked')){
					$esp.parent().siblings().show();
				}
				else{
					$esp.parent().siblings().hide();
				}
			}
			else{
				$trocaAnterior.hide();
			}
		}
		
		$trocaAnterior = $change[i];
	}
}

$plan.find('#plan_id').change(function(e) {
	memoPlan(LastPlan);
	LastPlan = $(this).val();
	restorePlan(LastPlan);
});

$(".week-control input[id$='_all']").change(function(e) {
	var marcado = $(this).is(':checked');
	
	$(this).parents(".week-control").find("input:checkbox").not("[id$='_all']").each(function(){
		if($(this).is(':checked')){
			if(!marcado){
				$(this).prop('checked', marcado).click();
			}
		}
		else if(marcado){
			$(this).prop('checked', marcado).click();
		}
	});
});

$changes.find(".week-control input:checkbox, .especial_date").not("[id$='_all']").change(function(e) {
	toggleChanges();
});

$('#save_prog').click(function(e){
	memoPlan( LastPlan );
	memoChanges();
	
	$('#json').val( JSON.stringify(prog) );
});

$('#restore_prog').click(function(e){
	prog = JSON.parse( $('#json').val() );
	
	restorePlan( LastPlan );
	restoreChanges();
});

restorePlan( LastPlan );
restoreChanges();
$('#json').val( JSON.stringify(prog) );
