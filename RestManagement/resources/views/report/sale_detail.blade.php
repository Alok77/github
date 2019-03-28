<h2 class="page-header">Sale Detail Report
    <div class="pull-right">
        <a href="{{url('report/export-detail-report')}}" class="btn btn-primary"><i
                    class="glyphicon glyphicon-export"></i> Export to Excel</a>
    </div>
</h2>
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
        {!! Form::select('category',['-1'=>'All Categories']+\App\ProductCategory::orderBy('name')->pluck('name','id')->toArray() ,Session::get('report_category'),['class'=>'form-control','style'=>'height:auto','id'=>'report_category']) !!}
    </div>
    <div class="form-group col-sm-1">
        <a href="javascript:ajaxLoad('report/sale-detail?report_from='+$('#report_from').val()+'&report_to='+$('#report_to').val()+'&report_category='+$('#report_category').val())"
           class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> </a>
    </div>
</div>
<table class="table" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th style="text-align: center"> No</th>
        <th> Description</th>
        <th> Category</th>
        <th style="text-align: center"> Quantity</th>
        <th style="text-align: right"> Unitprice</th>
        <th style="text-align: right"> Total</th>
    </tr>
    </thead>
    <tbody>
    <?php $total = 0;$discount = 0;$i = 1;?>
    @foreach($orderDetails as $orderDetail)
        <tr>
            <td align="center">{{$i++}}</td>
            <td>{!! $orderDetail->product_id?$orderDetail->description:'<b>'.$orderDetail->description.'</b>'!!}</td>
            @php
                $category=\App\ProductCategory::find($orderDetail->product_category_id);
            @endphp
            <td>{{$category?$category->name:''}}</td>
            <td align="center">{{$orderDetail->total}}</td>
            <td align="right">$ {{$orderDetail->price}}</td>
            <td align="right">$ {{$orderDetail->price * $orderDetail->total}}</td>
        </tr>
        <?php
        $total += $orderDetail->price * $orderDetail->total;
        $discount += $orderDetail->discount;
        ?>
    @endforeach
    </tbody>
</table>
<div style="text-align: right;float: right;border-top: solid 1px whitesmoke;margin-top: 10px;">
    <table width="100%" style="margin-top: 10px;margin-bottom: 10px">
        <tr>
            <th style="text-align: right;padding-right: 20px">Total:</th>
            <th style="text-align: right">$ {{number_format($total,2)}}</th>
        </tr>
        <tr>
            <th style="text-align: right;padding-right: 20px">Discount:</th>
            <th style="text-align: right">$ {{number_format($discount,2)}}</th>
        </tr>
        <tr>
            <th style="text-align: right;padding-right: 20px">Net Amount:</th>
            <th style="text-align: right">$ {{number_format($total-$discount,2)}}</th>
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