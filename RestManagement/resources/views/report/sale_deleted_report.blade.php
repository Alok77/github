<h1 class="page-header">Sale Deleted Report</h1>
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
        {!! Form::select('cashier',['-1'=>'All Cashiers']+\App\User::where('role','Cashier')->orderBy('username')->pluck('username','id')->toArray() ,Session::get('report_user'),['class'=>'form-control','style'=>'height:auto','onChange'=>"ajaxLoad('report/sale-deleted-report?report_user='+this.value)"]) !!}
    </div>
    <div class="form-group col-sm-1">
        <a href="javascript:ajaxLoad('report/sale-deleted-report?report_from='+$('#report_from').val()+'&report_to='+$('#report_to').val())"
           class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> </a>
    </div>
</div>
<table class="table table-bordered" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th> Ordered_Date</th>
        <th> Deleted_Date</th>
        <th> Invoice #</th>
        <th style="text-align: center"> Table #</th>
        <th> Product</th>
        <th style="text-align: center"> Quantity</th>
        <th style="text-align: right"> Unitprice</th>
        <th> Cashier</th>
    </tr>
    </thead>
    <tbody>
    @foreach($orders as $order)
        <tr>
            <td>{{date("d-M-Y H:i",strtotime($order->created_at))}}</td>
            <td>{{date("d-M-Y H:i",strtotime($order->deleted_at))}}</td>
            <td><a title="Table" data-toggle="modal" data-target="#modal"
                   href="report/view-detail/{{$order->order_id}}">
                    {{str_pad($order->order_id,6,0,0)}}
                </a></td>
            <td align="center">{{$order->table?$order->table->name:''}}</td>
            <td>{{$order->description}}</td>
            <td align="center">{{$order->quantity}}</td>
            <td align="right">{{$order->price}}</td>
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