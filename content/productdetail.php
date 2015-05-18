<?php if(!defined('BASEPATH')) die('You are not allowed to access this page');?>
<?php
	if($_POST['booking']){
		extract(html_entities($_POST));
		$subtotal = $qty * ($harga - (($diskon * $harga) /100));
		$data = array(
			'id'		=> $produk_id,
			'atribut_id'=> $atribut_id,
			'harga'		=> $harga,
			'diskon'	=> $diskon,
			'qty'		=> $qty,
			'satuan'	=> $satuan,
			'subtotal'	=> $subtotal
		);
		if(cartAddItem($data)){
			$msg = '<div class="success">Berhasil menyimpan ke keranjang belanja..</div>';
		} else {
			$msg = '<div class="error">Item sudah ada di keranjang belanja..</div>';
		}
		
		$_SESSION['msg'] = $msg;
		header("Location: index.php?p=productdetail&id=".$produk_id);
		exit();
	}

	//get record selected	
	$resQry = "SELECT a.*, 
		(SELECT nama FROM kategori WHERE id=a.kategori_id) category
		FROM produk a
		WHERE a.id='".$_GET['id']."' LIMIT 1";
	$results = mysql_query($resQry);
	$r = mysql_fetch_array($results);
	$vPrice = $r['harga'] - ($r['harga'] * $r['diskon']/ 100);
?>
<div class="wrapRegister wrapHomeDetail">
	<h3><?php echo $r['nama'];?></h3>
    <div class="clr"></div>
   	<div class="pic">
	   <img src="<?php echo $r['gambar'] ?>" alt="">
	
    </div>
    <div class="desc">
    	<span class="category clr">Kategori : <?php echo $r['category'];?></span>
        <span class="price clr" <?php echo ($r['diskon']>0)?'style="text-decoration:line-through;"':'';?>>Rp <?php echo number_format($r['harga']);?></span> 
        <?php if($r['diskon'] > 0):?>
        <span class="price price2 clr">Rp <?php echo number_format($vPrice);?></span>
        <span class="diskon clr">Diskon <?php echo $r['diskon']."%";?></span>   
        <?php endif; ?>
       
      <form name="formHomestay" class="formHomestay" method="post" action="" onSubmit="return validateForm('formHomestay');">
       	  <input type="hidden" name="produk_id" value="<?php echo $r['id'];?>">
          <input type="hidden" name="harga" value="<?php echo $r['harga'];?>">
          <input type="hidden" name="diskon" value="<?php echo $r['diskon'];?>">
          <input type="hidden" name="satuan" value="<?php echo $r['satuan'];?>">
          <?php
		  	$qq = mysql_query("SELECT * FROM produk_atribut WHERE produk_id='".$r['id']."'");
			if(mysql_num_rows($qq) > 0){
				echo '<h4>Pilihan Kue : </h4>';
				?>
                <select class="input required" name="atribut_id" id="atribut_id">
               		<option value="">( Tentukan Pilihan )</option>
                    <?php while($rr = mysql_fetch_array($qq)){ ?>
					<option value="<?php echo $rr['id'];?>" data-price="<?php echo $rr['harga'];?>"><?php echo $rr['nama'];?></option>
					<?php } ?>
               	</select>
                <?php
			} else {
			 echo '<input type="hidden" name="atribut_id" value="0">';
			}
		  ?><br>
          <h4>Qty (<?php echo $r['satuan'];?>) :</h4> 
          <input type="text" class="input required number" style="width:30px; margin-right:10px;" min="1" max="20" name="qty" id="qty" value="1" /><br>
          <input name="booking" type="submit" class="bButton" id="booking" value="Add to Cart">
      </form>
    </div>
    <div class="clr"></div>
    
    <h3>Keterangan</h3>
    <div class="summary clr" style="border-top:solid 1px #FFCC66; margin-bottom:20px; border-bottom:solid 1px #FFCC66; padding:10px 0;">
    	<?php echo html_entities_decode($r['keterangan_lengkap']);?>
    </div>
    <div class="clr"></div>
    
    <a href="javascript:history.back();" class="button">Kembali</a>
    
</div>
<div class="clr"></div>
<script type="text/javascript">
jQuery(function($){
	$('#atribut_id').change(function(){
		var diskon = $('input[name=diskon]').val();
		var harga = $('option:selected', this).attr('data-price');
		var vPrice = harga - ((diskon * harga) /100);
		
		$('input[name=harga]').val(harga);
		$('.wrapHomeDetail .price').html('Rp ' +number_format(harga));
		$('.wrapHomeDetail .price2').html('Rp ' +number_format(vPrice));
		
	});
});
</script>