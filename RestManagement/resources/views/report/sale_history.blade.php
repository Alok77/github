<h1 class="page-header">Sale History Report</h1>
<div class="modal fade " id="modal" tabindex="-1" role="dialog" aria-labelledby="modal"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content container-fluid">
        </div>
    </div>
</div>
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
        {!! Form::select('customer',['-1'=>'All Customers']+\App\Customer::orderBy('name')->pluck('name','id')->toArray() ,Session::get('report_customer'),['class'=>'form-control','style'=>'height:auto','onChange'=>"ajaxLoad('report/sale-history?report_customer='+this.value)"]) !!}
    </div>
    <div class="form-group col-sm-1">
        <a href="javascript:ajaxLoad('report/sale-history?report_from='+$('#report_from').val()+'&report_to='+$('#report_to').val())"
           class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> </a>
    </div>
</div>
<table class="table table-bordered" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th> Date</th>
        <th> Invoice #</th>
        <th> Table #</th>
        <th style="text-align: right"> Amount</th>
        <th style="text-align: right"> Discount</th>
        <th style="text-align: right"> Total</th>
        <th> Customer</th>
        <th> Cashier</th>
    </tr>
    </thead>
    <tbody>
    @foreach($orders as $order)
        <tr>
            <td>{{$order->created_at}}</td>
            <td><a title="Table" data-toggle="modal" data-target="#modal"
                   href="report/view-detail/{{$order->id}}">
                    {{str_pad($order->id,6,0,0)}}
                </a></td>
            <td align="center">{{$order->table?$order->table->name:''}}</td>
            <td align="right">
                <?php $amount = $order->order_details()->select(DB::raw('sum(quantity*price) as  total,sum(quantity*price*discount/100) as  discount'))->first();?>
                $ {{number_format($amount->total,2)}}</td>
            <td align="right">{{$order->discount}}%</td>
            <td align="right">
                $ {{number_format(($amount->total - $amount->discount) * (1-$order->discount/100),2)}}</td>
            <td>{{$order->customer_id && $order->customer?$order->customer->name:''}}</td>
            <td>{{$order->user?$order->user->username:''}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
<div class="pull-right">{!! str_replace('/?','?',$orders->render()) !!}</div>
<div class="row">
    <i class="col-sm-12">
        Total: {{$orders->total()}} records
    </i>
</div>
<script>
    $('#modal').on('shown.bs.modal', function () {
        $('#focus').focus().select();
    });
    $('#modal').on('hidden.bs.modal', function (e) {
        $(this).removeData('bs.modal');
    });
    $('#report_from, #report_to').pickadate({
        format: "dd-mmm-yyyy",
        selectMonths: true,
        selectYears: true,
    });
</script>