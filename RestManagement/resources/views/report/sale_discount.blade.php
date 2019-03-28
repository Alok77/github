<h2 class="page-header">Sale Discount Report </h2>

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
    <div class="col-sm-3 form-group">
        {!! Form::select('customer',['-1'=>'ALL','0'=>'Customer']+\App\Customer::orderBy('name')->pluck('name','id')->toArray() ,Session::get('report_customer'),['class'=>'form-control','style'=>'height:auto','id'=>'report_customer']) !!}
    </div>
    <div class="form-group col-sm-1">
        <a href="javascript:ajaxLoad('report/sale-discount?report_from='+$('#report_from').val()+'&report_to='+$('#report_to').val()+'&report_customer='+$('#report_customer').val())"
           class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> </a>
    </div>
</div>
<table class="table" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th style="text-align: center" width="100px"> No</th>
        <th> Customer</th>
        <th style="text-align: right"> Total</th>
    </tr>
    </thead>
    <tbody>
    <?php $total = 0; $i = 1;?>
    @foreach($discount as $s)
        <tr>
            <td align="center">{{$i++}}</td>
            <td>{{$s->customer_id==0?'Customer':$s->customer->name}}</td>
            <td align="right">${{number_format($s->total,2)}}</td>
        </tr>
        <?php $total += $s->total; ?>
    @endforeach
    </tbody>
</table>
<div style="text-align: right;float: right;border-top: solid 1px whitesmoke;margin-top: 10px;">
    <table width="100%" style="margin-top: 10px;margin-bottom: 10px">
        <tr>
            <th style="text-align: right;padding-right: 20px">Total:</th>
            <th style="text-align: right">$ {{number_format($total,2)}}</th>
        </tr>
    </table>
</div>
<script>
    $('#report_from, #report_to').pickadate({
        format: "dd-mmm-yyyy",
        selectMonths: true,
        selectYears: true,
    });
</script>