<h1 class="page-header">Stock Balance Report</h1>
<div class="col-md-3 form-group">
    {!! Form::select('category',['-1'=>'All Categories']+App\ItemCategory::orderBy('name')->pluck('name','id')->toArray() ,Session::get('item_category'),['class'=>'form-control','style'=>'height:auto','onChange'=>'ajaxLoad("'.url("report/stock-balance").'?category="+this.value)']) !!}
</div>
<div class="col-sm-4 form-group">
    <div class="input-group">
        <input class="form-control" id="search" value="{{ Session::get('item_search') }}"
               onkeydown="if (event.keyCode == 13) ajaxLoad('{{url('report/stock-balance')}}?ok=1&search='+this.value)"
               placeholder="Search..."
               type="text">

        <div class="input-group-btn">
            <button type="button" class="btn btn-default"
                    onclick="ajaxLoad('{{url('report/stock-balance')}}?ok=1&search='+$('#search').val())"><i
                        class="glyphicon glyphicon-search"></i>
            </button>
        </div>
    </div>
</div>
<table class="table table-bordered table-striped">
    <thead>
    <tr>
        <th width="50px" style="text-align: center">No</th>
        <th>
            <a href="javascript:ajaxLoad('report/stock-balance?field=name&sort={{Session::get("item_sort")=="asc"?"desc":"asc"}}')">
                Name
            </a>
            <i style="font-size: 12px"
               class="glyphicon  {{ Session::get('item_field')=='name'?(Session::get('item_sort')=='asc'?'glyphicon-sort-by-alphabet':'glyphicon-sort-by-alphabet-alt'):'' }}">
            </i>
        </th>
        <th>Category</th>
        <th style="text-align: center">Unit</th>
        <th style="text-align: center">Quantity</th>
    </tr>
    </thead>
    <tbody>
    <?php $i = 1;?>
    @foreach($items as $key=>$item)
        <tr>
            <td align="center">{{$i++}}</td>
            <td>{{$item->name}}</td>
            <td>{{$item->item_category_id?$item->item_category->name:''}}</td>
            <td align="center">{{$item->unit}}</td>
            <td style="text-align: center">
                {{$item->quantity}}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
<div class="pull-right">{!! str_replace('/?','?',$items->render()) !!}</div>
<div class="row">
    <i class="col-sm-12">
        Total: {{$items->total()}} records
    </i>
</div>