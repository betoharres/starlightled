prog = {
	prog:
	{
		ver: "1",
		plans:
		{
			dimer: [],
			delay: [],
			off:
			{
				boardLed1: [],
				boardLed2: [],
				sourceTemp: [],
				lightSensor: [],
				extMem: [],
				ucontrolBoardLed1: [],
				ucontrolBoardLed2: []
			}
		},
		changes:
		{
			plan: [],
			mode: [],
			week:
			{
				sun: [],
				mon: [],
				tue: [],
				wed: [],
				thu: [],
				fri: [],
				sat: []
			},
			hou: [],
			min: [],
			sec: [],
			day: [],
			mon: [],
			yea: []
		}
	}
};

var $plan = $('#panelPlans');
var $changes = $('#panelChanges');
var $change = [];
var LastPlan = $plan.find('#plan_id').val();

for(var i=1; i<=7; i++){
	$change[i] = $changes.find("#change_"+i);
}

function replacer(key, value) {
	if (value == null) {
		return '';
	}
	return value;
}

function memo(elementId, $base){
	var $orig = $base.find('#'+elementId);
	var val;
	if($orig.is(':checkbox')){
		val = $orig.prop('checked');
	}
	else{
		val = $orig.val();
	}
	
	if($orig.prop('type')=="number" || $orig.prop('type')=="checkbox"){
		val = Number(val);
	}
	
	return val;
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
	var o = prog.prog.plans;
	var des = o.off;
	
	p--;
	
	o.dimer[p]               = Number(memo( 'dimerization', $plan ));
	o.delay[p]               = memo( 'delay', $plan );
	des.boardLed1[p]         = memo( 'sensor1', $plan );
	des.boardLed2[p]         = memo( 'sensor2', $plan );
	des.sourceTemp[p]        = memo( 'sensor3', $plan );
	des.lightSensor[p]       = memo( 'sensor4', $plan );
	des.extMem[p]            = memo( 'sensor5', $plan );
	des.ucontrolBoardLed1[p] = memo( 'sensor6', $plan );
	des.ucontrolBoardLed2[p] = memo( 'sensor7', $plan );
	
	o.off = des;
	prog.prog.plans = o;
}

function restorePlan( p ){
	var o = prog.prog.plans;
	var des = o.off;
	
	p--;
	
	restore('dimerization', o.dimer[p], $plan );
	restore('delay', o.delay[p], $plan );
	restore('sensor1', des.boardLed1[p], $plan );
	restore('sensor2', des.boardLed2[p], $plan );
	restore('sensor3', des.sourceTemp[p], $plan );
	restore('sensor4', des.lightSensor[p], $plan );
	restore('sensor5', des.extMem[p], $plan );
	restore('sensor6', des.ucontrolBoardLed1[p], $plan );
	restore('sensor7', des.ucontrolBoardLed2[p], $plan );
}

function memoChanges (){
	var o = prog.prog.changes;
	var str, i, t;
	
	for (i = 0, t = 1; i < 7; i++, t++) {
		str = 'change_' + t + '_';
		
		o.plan[i] = Number(memo( str + 'plan', $change[t] ));
		o.mode[i] = Number(memo( str + 'mode', $change[t] ));
		
		o.week.sun[i] = memo( str + 'sun', $change[t] );
		o.week.mon[i] = memo( str + 'mon', $change[t] );
		o.week.tue[i] = memo( str + 'tue', $change[t] );
		o.week.wed[i] = memo( str + 'wed', $change[t] );
		o.week.thu[i] = memo( str + 'thu', $change[t] );
		o.week.fri[i] = memo( str + 'fri', $change[t] );
		o.week.sat[i] = memo( str + 'sat', $change[t] );
		
		o.hou[i] = memo(str + 'hour'   , $change[t] );
		o.min[i] = memo(str + 'minute' , $change[t] );
		o.sec[i] = memo(str + 'secound', $change[t] );
		o.day[i] = memo(str + 'day'    , $change[t] );
		o.mon[i] = memo(str + 'month'  , $change[t] );
		o.yea[i] = memo(str + 'year'   , $change[t] );
		
	}
	
	prog.prog.changes = o;
}

function restoreChanges (){
	var o = prog.prog.changes;
	var str, i, t;
	
	for (i = 0, t = 1; i < 7; i++, t++) {
		str = 'change_' + t + '_';
		
		restore(str + 'plan', o.plan[i], $change[t] );
		restore(str + 'mode', o.mode[i], $change[t] );
		
		restore(str + 'sun', o.week.sun[i], $change[t] );
		restore(str + 'mon', o.week.mon[i], $change[t] );
		restore(str + 'tue', o.week.tue[i], $change[t] );
		restore(str + 'wed', o.week.wed[i], $change[t] );
		restore(str + 'thu', o.week.thu[i], $change[t] );
		restore(str + 'fri', o.week.fri[i], $change[t] );
		restore(str + 'sat', o.week.sat[i], $change[t] );
		
		restore(str + 'hour'   , o.hou[i], $change[t] );
		restore(str + 'minute' , o.min[i], $change[t] );
		restore(str + 'secound', o.sec[i], $change[t] );
		
		restore(str + 'day'    , o.day[i], $change[t] );
		restore(str + 'month'  , o.mon[i], $change[t] );
		restore(str + 'year'   , o.yea[i], $change[t] );
		
		if(o.day[i] >= 1 && o.mon[i] >= 1){
			$change[t].find("#change_"+t+"_especial_date").prop('checked', true);
		}
		
		$change[t].find(".week-control :checkbox").not("[id$='_all']").each(function(e){
			if($(this).is(':checked')){
				$(this).parent().addClass("active");
			}
			else{
				$(this).parent().removeClass("active");
			}
		});
	}
	toggleChanges();
}

function memoProg(){
	memoPlan( LastPlan );
	memoChanges();
	
	$('#json').val( JSON.stringify(prog, replacer) );
	$('#config_file_content').val( $('#json').val() );
}

function restoreProg(){
	var aux = JSON.parse( $('#config_file_content').val() );
	
	if($.isEmptyObject(aux)){
		memoProg();
	}
	else{
		prog = aux;
		$('#json').val( $('#config_file_content').val() );
	
		restorePlan( LastPlan );
		restoreChanges();
	}
	
	toggleChanges();
}

function toggleChanges(){
	var $lastChange=false;
	var showAll = false;
	var $esp;
	for(var i=7; i>0; i--){
		if($lastChange){
			if(showAll || $change[i].find(".week-control input:checked").not("[id$='_all']").length>0){
				showAll = true;
				$lastChange.show();
			}
			else{
				$lastChange.hide();
			}
		}
		
		$esp = $change[i].find("#change_"+i+"_especial_date");
		if($esp.is(':checked')){
			$esp.parent().siblings().show();
		}
		else{
			$esp.parent().siblings().val(0).hide();
//			$change[i].find("#change_"+i+"_day").val(0);
//			$change[i].find("#change_"+i+"_month").val(0);
//			$change[i].find("#change_"+i+"_year").val(0);
		}
		
		$lastChange = $change[i];
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
		if(marcado){
			$(this).prop('checked', marcado).parent().addClass("active");
		}
		else{
			$(this).prop('checked', marcado).parent().removeClass("active");
		}
	});
	toggleChanges();
});

$changes.find(".week-control input:checkbox, .especial_date").not("[id$='_all']").change(function(e) {
	toggleChanges();
});

$plan.on("change", "input, select", memoProg);
$changes.on("change", "input, select", memoProg);

restoreProg();
