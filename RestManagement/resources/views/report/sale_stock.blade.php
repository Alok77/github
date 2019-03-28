<h2 class="page-header">Sale Stock Report </h2>
<div class="row">
    <div class="col-sm-3 form-group">
        <div class='input-group date'>
<span class="input-group-addon">
<i class="glyphicon glyphicon-calendar"></i>
</span>
            <input type='text' class="form-control" id="report_from"
                   value="{{date('d-M-Y',strtotime(Session::get('report_from')))}}"/>
        </div>
    </div>
    <div class="col-sm-3 form-group">
        <div class='input-group date'>
<span class="input-group-addon">
<i class="glyphicon glyphicon-calendar"></i>
</span>
            <input type='text' class="form-control" id="report_to"
                   value="{{date('d-M-Y',strtotime(Session::get('report_to')))}}"/>
        </div>
    </div>
    <div class="form-group col-sm-1">
        <a href="javascript:ajaxLoad('report/sale-stock?report_from='+$('#report_from').val()+'&report_to='+$('#report_to').val())"
           class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> </a>
    </div>
</div>
<table class="table" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th> Product</th>
        <th> Category</th>
        <th> Unit</th>
        <th style="text-align: center"> Quantity</th>
    </tr>
    </thead>
    <tbody>
    @foreach($stock as $s)
        <tr>
            <td>{{$s->name}}</td>
            <td>{{$s->item_category_id?\App\ItemCategory::find($s->item_category_id)->name:''}}</td>
            <td>{{$s->unit}}</td>
            <td align="center">{{number_format($s->total,2)}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
<script>
    $('#report_from, #report_to').pickadate({
        format: "dd-mmm-yyyy",
        selectMonths: true,
        selectYears: true,
    });
</script>