<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title">View Order Detail</h4>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-md-5">
            <table class="table">
                <tr>
                    <th style="text-align: right;border-top: none">Invoice:</th>
                    <th style="border-top: none">{{str_pad($order->id,6,0,0)}}</th>
                </tr>
                <tr>
                    <th style="text-align: right;border-top: none">Table:</th>
                    <td style="border-top: none">{{$order->table->name}}</td>
                </tr>
                <tr>
                    <th style="text-align: right;border-top: none">Checked in:</th>
                    <td style="border-top: none">{{date('d-M-Y H:i',strtotime($order->checked_in))}}</td>
                </tr>
                <tr>
                    <th style="text-align: right;border-top: none">Checked out:</th>
                    <td style="border-top: none">{{date('d-M-Y H:i',strtotime($order->checked_out))}}</td>
                </tr>
                <tr>
                    <th style="text-align: right;border-top: none">Cashier:</th>
                    <td style="border-top: none">{{$order->user?$order->user->username:''}}</td>
                </tr>
                <tr>
                    <th style="text-align: right;border-top: none">Customer:</th>
                    <td style="border-top: none">{{$order->customer_id && $order->customer?$order->customer->name:''}}</td>
                </tr>
                <tr>
                    <th style="text-align: right;border-top: none">Cash in:</th>
                    <td style="border-top: none">$ {{$order->usd}}</td>
                </tr>
            </table>
        </div>
        <div class="col-md-7">
            <table class="table" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th width="50px" style="text-align: center">
                        No
                    </th>
                    <th> Description</th>
                    <th> Qty</th>
                    <th> U.Price</th>
                    <th> D.C</th>
                    <th> Total</th>
                </tr>
                </thead>
                <tbody>
                <?php $total = 0; $i = 1;?>
                @foreach($order->order_details()->withTrashed()->get() as $sale)
                    <tr @if(!empty($sale->deleted_at)) style="text-decoration: line-through" @endif>
                        <td style="text-align: center">{{$i++}}
                        </td>
                        <td>{{$sale->description}}</td>
                        <td width="10px">{{$sale->quantity}}</td>
                        <td align="right" width="40px">$ {{number_format($sale->price,2)}}</td>
                        <td align="center" width="30px">{{$sale->discount}}%</td>
                        <td align="right" width="70px">
                            $ {{number_format($sale->quantity * $sale->price *(1-$sale->discount/100),2)}}</td>
                    </tr>
                    <?php if (empty($sale->deleted_at)) $total += ($sale->price * $sale->quantity * (1 - $sale->discount / 100)); ?>
                @endforeach
                </tbody>
            </table>
            <div style="text-align: right;float: right;border-top: solid 1px whitesmoke;">
                <table width="100%">
                    <tr>
                        <th style="text-align: right;padding-right: 20px">Discount:</th>
                        <th style="text-align: right">{{$order->discount}} %</th>
                    </tr>
                    <tr>
                        <th style="text-align: right;padding-right: 20px">Total:</th>
                        <th style="text-align: right">$ {{number_format($total*(1-$order->discount/100),2)}}</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>