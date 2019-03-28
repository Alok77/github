<h2 class="page-header">Sale Graph Report </h2>
<div class="row">
    <div class="col-sm-3 form-group">
        <div class='input-group date'>
<span class="input-group-addon">
<i class="glyphicon glyphicon-calendar"></i>
</span>
            <input type='text' class="form-control" id="from"
                   value="{{date('d-M-Y',strtotime(Session::get('from')))}}"/>
        </div>
    </div>
    <div class="col-sm-3 form-group">
        <div class='input-group date'>
<span class="input-group-addon">
<i class="glyphicon glyphicon-calendar"></i>
</span>
            <input type='text' class="form-control" id="to"
                   value="{{date('d-M-Y',strtotime(Session::get('to')))}}"/>
        </div>
    </div>
    <div class="col-sm-3 form-group">
        <select class="form-control" onchange="ajaxLoad('report/sale-graph?dm='+this.value)">
            <option {{Session::get('dm')=='Day'?'selected':''}} value="Day">Day</option>
            <option {{Session::get('dm')=='Month'?'selected':''}} value="Month">Month</option>
        </select>
    </div>
    <div class="col-sm-2 form-group">
        <a href="javascript:ajaxLoad('report/sale-graph?from='+$('#from').val()+'&to='+$('#to').val())"
           class="btn btn-primary"><i
                    class="glyphicon glyphicon-search"></i> </a>
    </div>
</div>
<div class="row">
    <div id="line"></div>
</div>
</div>
<script>
    $('#line').highcharts({
        colors: ['#058DC7', '#50B432', '#cc00cc', 'red', '#cc0033', '#DDDF00', '#64E572', '#24CBE5', '#FFF263', '#FF9655'],
        title: {
            text: 'Sale Summary Report',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: <?php echo json_encode($iv); ?>

        },
        yAxis: {
            title: {
                text: 'Cash in hand ($)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                        return Highcharts.numberFormat(this.y, 2);
                    }
                },
                enableMouseTracking: false
            }
        },
        tooltip: {
            headerFormat: '',
            valuePrefix: '$'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [
            {
                name: 'Breakfast',
                marker: {symbol: "circle"},
                data:<?php echo json_encode($morning); ?>
            },
            {
                name: 'Lunch',
                marker: {symbol: "circle"},
                data:<?php echo json_encode($afternoon); ?>
            },
            {
                name: 'Dinner',
                marker: {symbol: "circle"},
                data:<?php echo json_encode($evening); ?>
            },
            {
                name: 'Daily',
                marker: {symbol: "circle"},
                data:<?php echo json_encode($daily); ?>
            }
        ]
    });
    $('#from, #to').pickadate({
        format: "dd-mmm-yyyy",
        selectMonths: true,
        selectYears: true
    });
</script>