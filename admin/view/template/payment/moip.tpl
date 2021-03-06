<?php echo $header; ?>
<div id="content">
	
	<!------------------>
	<!--  Breadcrumb  -->
	<!------------------>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb): ?>
		<?php echo $breadcrumb['separator'] ?><a href="<?php echo $breadcrumb['href'] ?>"><?php echo $breadcrumb['text'] ?></a>
		<?php endforeach; ?>
	</div>
	
	<!------------------>
	<!--    Error     -->
	<!------------------>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	
	<!------------------>
	<!--   Content    -->
	<!------------------>
	<div class="box">
		
		<!------------------>
		<!--   Heading    -->
		<!------------------>
		<div class="heading">
			<h1><img alt="" src="view/image/payment.png" /><?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
				<a onclick="location='<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
			</div>
		</div>
		<div class="content" style="min-height:1100px;">
			
			<!------------------>
			<!--     Tabs     -->
			<!------------------>
			<div id="vtabs" class="vtabs">
				<a href="#tab-config"><?php echo $tab_config ?></a>
				<a href="#tab-status"><?php echo $tab_status ?></a>
				<a href="#tab-order"><?php echo $tab_order ?></a>
				<a href="#tab-parcelas"><?php echo $tab_parcelas ?></a>          
				<a href="#tab-boleto"><?php echo $tab_boleto ?></a>
				<a href="#tab-formasPagamento"><?php echo $tab_formasPagamento ?></a>
				<a href="#tab-suporte"><?php echo $tab_suporte ?></a>
			</div>
			
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				
				<!------------------>
				<!--Configurações -->
				<!------------------>
				<div id="tab-config">
					<table class="form" style="width:auto !important;">
						
						<!------------------>
						<!--    Status   -->
						<!------------------>
						<tr>
							<td><?php echo $entry_status; ?></td>
							<td><select name="moip_status">
								<?php if ($moip_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
						</tr>
						
						<!------------------>
						<!--    Razão    -->
						<!------------------>
						<tr>
							<td>
								<span class="required">*</span> <?php echo $entry_razao; ?>
								<span class="help"><?php echo $help_razao; ?></span>
							</td>
							<td>
								<input type="text" name="moip_razao" value="<?php echo $moip_razao; ?>" />
								<br />
								<?php if (isset($error_razao)) { ?>
								<span class="error"><?php echo $error_razao; ?></span>
								<?php } ?>
							</td>
						</tr>
						
						<!------------------>
						<!--    Token    -->
						<!------------------>
						<tr>
							<td><span class="required">*</span> <?php echo $entry_apitoken; ?></td>
							<td>
								<input type="text" name="moip_apitoken" value="<?php echo $moip_apitoken; ?>" size="40" />
							</td>  
						</tr>
						
						<!------------------>
						<!--     Key     -->
						<!------------------>
						<tr>
							<td><span class="required">*</span> <?php echo $entry_apikey; ?></td>
							<td>
								<input type="text" name="moip_apikey" value="<?php echo $moip_apikey; ?>" size="45"/>
								<?php if (isset($erro_apikey)) { ?>
								<span class="error"><?php echo $erro_apikey; ?></span>
								<?php } ?>
							   </td>
						</tr>
						
						<!------------------>
						<!--  Modo Teste -->
						<!------------------>
						<tr>
							<td><span class="required">*</span><?php echo $entry_test; ?></td>
							<td><?php if ($moip_test) { ?>
								<input type="radio" name="moip_test" value="1" checked="checked" />
								<?php echo $text_yes; ?>
								<input type="radio" name="moip_test" value="0" />
								<?php echo $text_no; ?>
								<?php } else { ?>
								<input type="radio" name="moip_test" value="1" />
								<?php echo $text_yes; ?>
								<input type="radio" name="moip_test" value="0" checked="checked" />
								<?php echo $text_no; ?>
								<?php } ?>
								<?php if (isset($erro_test)) { ?>
								<span class="error"><?php echo $erro_test; ?></span>
								<?php } ?>
								</td>
						</tr>
						
						<!------------------>
						<!-- Notificação -->
						<!------------------>
						<tr>
							<td>
								<span class="required">*</span><?php echo $entry_notify; ?>
								<span class="help"><?php echo $help_notify ?></span>
							</td>
							<td>
								<?php if ($moip_notify) { ?>
								<input type="radio" name="moip_notify" checked value="1" /><?php echo $text_yes; ?>
								<input type="radio" name="moip_notify" value="0" /><?php echo $text_no; ?>
								<?php }else{ ?>
								<input type="radio" name="moip_notify" value="1" /><?php echo $text_yes; ?>
								<input type="radio" name="moip_notify" checked value="0" /><?php echo $text_no; ?>
								<?php } ?>
								<?php if (isset($erro_notify)) { ?>
								<span class="error"><?php echo $erro_notify; ?></span>
								<?php } ?>
							</td>
						</tr>
						
						<!------------------>
						<!--   Parcela   -->
						<!------------------>
						<tr>
							<td><?php echo $entry_modoParcela ?></td>
							<td>
								<select name="moip_modoParcelas">
									<?php if ($moip_modoParcelas == 'select'): ?>
									<option value="select" selected="selected">DropDown</option>
									<?php else: ?>
									<option value="select">DropDown</option>
									<?php endif; ?>
									<?php if($moip_modoParcelas == 'radio'): ?>
									<option value="radio"selected="selected">Rádio Button</option>
									<?php else: ?>
									<option value="radio">Rádio Button</option>
									<?php endif; ?>
									<?php if($moip_modoParcelas == 'radio2Cols'): ?>
									<option value="radio2Cols"selected="selected">Rádio Button 2 Cols</option>
									<?php else: ?>
									<option value="radio2Cols">Rádio Button 2 Cols</option>
									<?php endif; ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!-- Valor Total -->
						<!------------------>
						<tr>
							<td><?php echo $entry_valorTotal ?></td>
							<td>
								<?php if ($moip_exibiTotalParcela == '1'): ?>
								<input type="radio" name="moip_exibiTotalParcela" value="1" checked="checked" /><?php echo $text_yes ?>
								<?php else: ?>
								<input type="radio" name="moip_exibiTotalParcela" value="1" /><?php echo $text_yes ?>
								<?php endif; ?>
								<?php if ($moip_exibiTotalParcela == '0'): ?>
								<input type="radio" name="moip_exibiTotalParcela" value="0" checked="checked" /><?php echo $text_no ?>
								<?php else: ?>
								<input type="radio" name="moip_exibiTotalParcela" value="0" /><?php echo $text_no ?>
								<?php endif; ?>
							</td>
						</tr>
						
						<tr>
							<td>
								<?php echo $entry_stepFive; ?>
								<span class="help"><?php echo $help_stepFive; ?></span>
							</td>
							<td>
								<select name="stepFive">
									<?php if ($stepFive == 1): ?>
									<option value="1" selected="selected">Sim</option>
									<?php else: ?>
									<option value="1">Sim</option>
									<?php endif; ?>
									
									<?php if ($stepFive == 0): ?>
									<option value="0" selected="selected">Não</option>
									<?php else: ?>
									<option value="0">Não</option>
									<?php endif; ?>
								</select>
							</td>
						</tr>
					</table>
				</div>
				
				<!------------------>
				<!--    Status   -->
				<!------------------>
				<div id="tab-status">
					<table class="form" style="width:auto !important;">
						
						<!------------------>
						<!-- Autorizado  -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_autorizdo; ?>
								<span class="help"><?php echo $help_autorizado; ?></span>
							</td>
							<td>
								<select name="moip_autorizado" id="moip_autorizado">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_autorizado) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--   Iniciado  -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_iniciado; ?>
								<span class="help"><?php echo $help_iniciado; ?></span>
							</td>
							<td>
								<select name="moip_iniciado" id="moip_iniciado">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_iniciado) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--    Boleto   -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_boletoimpresso; ?>
								<span class="help"><?php echo $help_boletoimpresso; ?></span>
							</td>
							<td>
								<select name="moip_boletoimpresso" id="moip_boletoimpresso">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_boletoimpresso) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--  Concluido  -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_concluido; ?>
								<span class="help"><?php echo $help_concluido; ?></span>
							</td>
							<td>
								<select name="moip_concluido" id="moip_concluido">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_concluido) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--  Cancelado  -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_cancelado; ?>
								<span class="help"><?php echo $help_cancelado; ?></span>
							</td>
							<td>
								<select name="moip_cancelado" id="moip_cancelado">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_cancelado) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--   Analise   -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_emanalise; ?>
								<span class="help"><?php echo $help_emanalise; ?></span>
							</td>
							<td>
								<select name="moip_emanalise" id="moip_emanalise">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_emanalise) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--  Estornado  -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_estornado; ?>
								<span class="help"><?php echo $help_estornado; ?></span>
							</td>
							<td>
								<select name="moip_estornado" id="moip_estornado">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_estornado) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--   Revisão   -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_revisao; ?>
								<span class="help"><?php echo $help_revisao; ?></span>
							</td>
							<td><select name="moip_revisao" id="moip_revisao">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_revisao) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!-- Reembolsado -->
						<!------------------>
						<tr>
							<td>
								<?php echo $entry_reembolsado; ?>
								<span class="help"><?php echo $help_reembolsado; ?></span>
							</td>
							<td>
								<select name="moip_reembolsado" id="moip_reembolsado">
									<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $moip_reembolsado) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
										<?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>">
									<?php echo $order_status['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
					</table>
				</div>
				
				<!------------------>
				<!-- Área e Ordem-->
				<!------------------>
				<div id="tab-order">
					<table class="form" style="width:auto !important;">
						
						<!------------------>
						<!--     Zona    -->
						<!------------------>
						<tr>
							<td><?php echo $entry_geo_zone; ?></td>
							<td>
								<select name="moip_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
									<?php if ($geo_zone['geo_zone_id'] == $moip_geo_zone_id) { ?>
									<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected">
									<?php echo $geo_zone['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--    Ordem    -->
						<!------------------>
						<tr>
							<td><?php echo $entry_sort_order; ?></td>
							<td><input type="text" name="moip_sort_order" value="<?php echo $moip_sort_order; ?>" size="1" /></td>
						</tr>
					</table>
				</div>
				
				<!------------------>
				<!--   Parcelas  -->
				<!------------------>
				<div id="tab-parcelas">
					<table class="list" style="margin:10px 0 0 200px;width:85% !important;" id="parcelas">
						<!------------------>
						<!--  Cabeçalho  -->
						<!------------------>
						<thead>
							<tr>
								<td class="left"><?php echo $entry_parcelaDe ?></td>
								<td class="left"><?php echo $entry_parcelaPara ?></td>
								<td class="left"><?php echo $entry_parcelaJuros ?></td>
								<td></td>
							</tr>
						</thead>
						<?php $module_row = 0; ?>
						<?php $maxParcela = $moip_parcelas[0]['de']; ?>
						<?php foreach ($moip_parcelas as $parcela) { ?>
						<tbody id="module-row<?php echo $module_row ?>">
							
							<!------------------>
							<!--      De     -->
							<!------------------>
							<tr>
								<td class="left">
									<select name="moip_parcelas[<?php echo $module_row ?>][de]">
										<?php if ($parcela['de'] == 2) { ?>
										<option value="2" selected="selected">2</option>
										<?php }else{ ?>
										<option value="2">2</option>
										<?php } ?>
										<?php if ($parcela['de'] == 3) { ?>
										<option value="3" selected="selected">3</option>
										<?php }else{ ?>
										<option value="3">3</option>
										<?php } ?>
										<?php if ($parcela['de'] == 4) { ?>
										<option value="4" selected="selected">4</option>
										<?php }else{ ?>
										<option value="4">4</option>
										<?php } ?>
										<?php if ($parcela['de'] == 5) { ?>
										<option value="5" selected="selected">5</option>
										<?php }else{ ?>
										<option value="5">5</option>
										<?php } ?>
										<?php if ($parcela['de'] == 6) { ?>
										<option value="6" selected="selected">6</option>
										<?php }else{ ?>
										<option value="6">6</option>
										<?php } ?>
										<?php if ($parcela['de'] == 7) { ?>
										<option value="7" selected="selected">7</option>
										<?php }else{ ?>
										<option value="7">7</option>
										<?php } ?>
										<?php if ($parcela['de'] == 8) { ?>
										<option value="8" selected="selected">8</option>
										<?php }else{ ?>
										<option value="8">8</option>
										<?php } ?>
										<?php if ($parcela['de'] == 9) { ?>
										<option value="9" selected="selected">9</option>
										<?php }else{ ?>
										<option value="9">9</option>
										<?php } ?>
										<?php if ($parcela['de'] == 10) { ?>
										<option value="10" selected="selected">10</option>
										<?php }else{ ?>
										<option value="10">10</option>
										<?php } ?>
										<?php if ($parcela['de'] == 11) { ?>
										<option value="11" selected="selected">11</option>
										<?php }else{ ?>
										<option value="11">11</option>
										<?php } ?>
										<?php if ($parcela['de'] == 12) { ?>
										<option value="12" selected="selected">12</option>
										<?php }else{ ?>
										<option value="12">12</option>
										<?php } ?>
									</select>
								</td>
								
								<!------------------>
								<!--     Para    -->
								<!------------------>
								<td class="right">
									<select name="moip_parcelas[<?php echo $module_row ?>][para]">
										<?php if ($parcela['para'] == 2) { ?>
										<option value="2" selected="selected">2</option>
										<?php }else{ ?>
										<option value="2">2</option>
										<?php } ?>
										<?php if ($parcela['para'] == 3) { ?>
										<option value="3" selected="selected">3</option>
										<?php }else{ ?>
										<option value="3">3</option>
										<?php } ?>
										<?php if ($parcela['para'] == 4) { ?>
										<option value="4" selected="selected">4</option>
										<?php }else{ ?>
										<option value="4">4</option>
										<?php } ?>
										<?php if ($parcela['para'] == 5) { ?>
										<option value="5" selected="selected">5</option>
										<?php }else{ ?>
										<option value="5">5</option>
										<?php } ?>
										<?php if ($parcela['para'] == 6) { ?>
										<option value="6" selected="selected">6</option>
										<?php }else{ ?>
										<option value="6">6</option>
										<?php } ?>
										<?php if ($parcela['para'] == 7) { ?>
										<option value="7" selected="selected">7</option>
										<?php }else{ ?>
										<option value="7">7</option>
										<?php } ?>
										<?php if ($parcela['para'] == 8) { ?>
										<option value="8" selected="selected">8</option>
										<?php }else{ ?>
										<option value="8">8</option>
										<?php } ?>
										<?php if ($parcela['para'] == 9) { ?>
										<option value="9" selected="selected">9</option>
										<?php }else{ ?>
										<option value="9">9</option>
										<?php } ?>
										<?php if ($parcela['para'] == 10) { ?>
										<option value="10" selected="selected">10</option>
										<?php }else{ ?>
										<option value="10">10</option>
										<?php } ?>
										<?php if ($parcela['para'] == 11) { ?>
										<option value="11" selected="selected">11</option>
										<?php }else{ ?>
										<option value="11">11</option>
										<?php } ?>
										<?php if ($parcela['para'] == 12) { ?>
										<option value="12" selected="selected">12</option>
										<?php }else{ ?>
										<option value="12">12</option>
										<?php } ?>
									</select>
								</td>
								
								<!------------------>
								<!--    Juros    -->
								<!------------------>
								<td class="right">
									<input type="text" value="<?php echo $parcela['juros'] ?>" name="moip_parcelas[<?php echo $module_row; ?>][juros]" title="Juros" />
								</td>
								<td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remover ?></a></td>
							</tr>
						</tbody>
						<?php $module_row++; ?>
						<?php } ?>
						<tfoot>
							
							<!------------------>
							<!-- Add Parcela -->
							<!------------------>
							<tr>
								<td colspan="3"></td>
								<td class="left"><a onclick="addParcela();" class="button"><?php echo $button_adicionar ?></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				<!------------------>
				<!--    Boleto   -->
				<!------------------>
				<div id="tab-boleto">
					<table class="form" style="width:auto !important;">
					
						<!------------------>
						<!--    Prazo    -->
						<!------------------>
						<tr>
							<td><?php echo $entry_boletoPrazo ?></td>
							<td><input type="text" name="moip_diasCorridosBoleto" maxlength="2" size="2" value="<?php echo $moip_diasCorridosBoleto ?>" /></td>
						</tr>
						
						<!------------------>
						<!--  Instrução1 -->
						<!------------------>
						<tr>
							<td><?php echo $entry_boletoInstrucao ?> 1: </td>
							<td><input type="text" name="moip_instrucaoUmBoleto" maxlength="63" value="<?php echo $moip_instrucaoUmBoleto ?>" /></td>
						</tr>
						
						<!------------------>
						<!--  Instrução2 -->
						<!------------------>
						<tr>
							<td><?php echo $entry_boletoInstrucao ?> 2: </td>
							<td><input type="text" name="moip_instrucaoDoisBoleto" maxlength="63" value="<?php echo $moip_instrucaoDoisBoleto ?>" /></td>
						</tr>
						
						<!------------------>
						<!--  Instrução3 -->
						<!------------------>
						<tr>
							<td><?php echo $entry_boletoInstrucao ?> 3: </td>
							<td><input type="text" name="moip_instrucaoTresBoleto" maxlength="63" value="<?php echo $moip_instrucaoTresBoleto ?>" /></td>
						</tr>
						
						<!------------------>
						<!--   URL Logo  -->
						<!------------------>
						<tr>
							<td><?php echo $entry_boletoUrlLogo ?>: 
								<span class="help"><?php echo $help_boletoUrlLogo ?></span>
							</td>
							<td><input type="text" name="moip_urlLogoBoleto" value="<?php echo $moip_urlLogoBoleto ?>" /></td>
						</tr>
					</table>
				</div>
				
				
				<!------------------>
				<!--  Pagamentos -->
				<!------------------>
				<div id="tab-formasPagamento">
					<table class="form" style="width:auto !important;">
						
						<!------------------>
						<!--    Cartão   -->
						<!------------------>
						<tr>
							<td><?php echo $entry_cartaoCredito ?></td>
							<td>
								<select name="moip_accCartaoCredito">
									<?php if ($moip_accCartaoCredito == 1): ?>
									<option value="1" selected="selected"><?php echo $text_yes ?></option>
									<?php else: ?>
									<option value="1"><?php echo $text_yes ?></option>
									<?php endif; ?>
									<?php if ($moip_accCartaoCredito == 0): ?>
									<option value="0" selected="selected"><?php echo $text_no ?></option>
									<?php else: ?>
									<option value="0"><?php echo $text_no ?></option>
									<?php endif; ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--    Boleto   -->
						<!------------------>
						<tr>
							<td><?php echo $entry_boleto ?></td>
							<td>
								<select name="moip_accBoleto">
									<?php if ($moip_accBoleto == 1): ?>
									<option value="1" selected="selected"><?php echo $text_yes ?></option>
									<?php else: ?>
									<option value="1"><?php echo $text_yes ?></option>
									<?php endif; ?>
									<?php if ($moip_accBoleto == 0): ?>
									<option value="0" selected="selected"><?php echo $text_no ?></option>
									<?php else: ?>
									<option value="0"><?php echo $text_no ?></option>
									<?php endif; ?>
								</select>
							</td>
						</tr>
						
						<!------------------>
						<!--   Débito   -->
						<!------------------>
						<tr>
							<td><?php echo $entry_debito ?></td>
							<td>
								<select name="moip_accDebito">
									<?php if ($moip_accDebito == 1): ?>
									<option value="1" selected="selected"><?php echo $text_yes ?></option>
									<?php else: ?>
									<option value="1"><?php echo $text_yes ?></option>
									<?php endif; ?>
									<?php if ($moip_accDebito == 0): ?>
									<option value="0" selected="selected"><?php echo $text_no ?></option>
									<?php else: ?>
									<option value="0"><?php echo $text_no ?></option>
									<?php endif; ?>
								</select>
							</td>
						</tr>
					</table>
				</div>
				
			</form>
			
			<!------------------>
			<!--   Heading   -->
			<!------------------>
			<div id="tab-suporte">
				<form name="frmSuporte" method="post">
					<table class="form" style="width:85% !important;">
						
						<!------------------>
						<!--   Suporte   -->
						<!------------------>
						<tr>
							<td><?php echo $entry_suporteAssunto ?></td>
							<td><input type="text" value="" name="suporteAssunto" />
							<span class="warning" style="display:none;"><?php echo $error_assunto ?></span></td>
						</tr>
						
						<!------------------>
						<!--   Mensagem  -->
						<!------------------>
						<tr>
							<td valign="top"><?php echo $entry_suporteMensagem ?></td>
							<td><textarea name="suporteMensagem" value="" rows="5" cols="50"></textarea>
							<span class="warning" style="display:none;"><?php echo $error_mensagem ?></span></td>
						</tr>
						
						<!------------------>
						<!--    Enviar   -->
						<!------------------>
						<tr>
							<td></td>
							<td><a onClick="contatoSuporte();" class="button"><?php echo $button_enviar ?></a></td>
						</tr>
						
						<!------------------>
						<!--  Mensagens  -->
						<!------------------>
						<tr>
							<td colspan="2">
								<div class="attention" id="msgAtencao" style="display:none;"><span><?php echo $attention_suporte ?><span></div>
								<div class="success" id="msgSucesso" style="display:none;"><span><?php echo $success_suporte ?><span></div>
							</td>
						</tr>
					</table>
				</form>
				<strong>Autor: <a href="http://www.valdeirsantana.com.br">Valdeir Santana</a></strong>
			</div>
		</div>
	</div>
</div>
<script><!--
$('.vtabs a').tabs();

var module_row = '<?php echo $module_row; ?>';
var moip_pagadorTaxa = '<?php echo $moip_pagadorTaxa; ?>';

if (moip_pagadorTaxa == 'afiliado'){
	$('input[name="moip_loginMoip"]').hide();
}

$('select[name="moip_pagadorTaxa"]').change(function(){
	if (this.value == 'afiliado'){
		$('input[name="moip_loginMoip"]').hide();
	}else{
		$('input[name="moip_loginMoip"]').show();
	}
});

function contatoSuporte() {
	
	if ($('input[name="suporteAssunto"]').val() != '') {
		$('input[name="suporteAssunto"] ~ span').hide('slow');
	}
	
	if ($('textarea[name="suporteMensagem"]').val() != '') {
		$('textarea[name="suporteMensagem"] ~ span').hide('slow');
	}
	
	if ($('input[name="suporteAssunto"]').val() == '') {
		$('input[name="suporteAssunto"] ~ span').show('slow');
		return false;
	}
	
	if ($('textarea[name="suporteMensagem"]').val() == '') {
		$('textarea[name="suporteMensagem"] ~ span').show('slow');
		return false;
	}
	
	$.ajax({
		url: 'index.php?route=payment/moip/suporte&token=<?php echo $token; ?>',
		type: 'GET',
		data: 'suporteAssunto='+$('input[name="suporteAssunto"]').val()+'&suporteMensagem='+$('textarea[name="suporteMensagem"]').val(),
		beforeSend: function () {
			$('#msgAtencao').show('slow');
		},
		success: function () {
			$('#msgAtencao').hide('fast');
			$('#msgSucesso').show('slow');
		}
	});
	
	
}

function addParcela() {
	
	html  = '<tbody id="module-row'+module_row+'">'
	html += '	<tr>'
	html += '		<td class="left">'
	html += '			<select name="moip_parcelas[\''+module_row+'\'][de]">'
	html += '				<option value="2">2</option>'
	html += '				<option value="3">3</option>'
	html += '				<option value="4">4</option>'
	html += '				<option value="5">5</option>'
	html += '				<option value="6">6</option>'
	html += '				<option value="7">7</option>'
	html += '				<option value="8">8</option>'
	html += '				<option value="9">9</option>'
	html += '				<option value="10">10</option>'
	html += '				<option value="11">11</option>'
	html += '				<option value="12">12</option>'
	html += '			</select>'
	html += '		</td>'
	html += '		<td class="right">'
	html += '			<select name="moip_parcelas[\''+module_row+'\'][para]">'
	html += '				<option value="2">2</option>'
	html += '				<option value="3">3</option>'
	html += '				<option value="4">4</option>'
	html += '				<option value="5">5</option>'
	html += '				<option value="6">6</option>'
	html += '				<option value="7">7</option>'
	html += '				<option value="8">8</option>'
	html += '				<option value="9">9</option>'
	html += '				<option value="10">10</option>'
	html += '				<option value="11">11</option>'
	html += '				<option value="12">12</option>'
	html += '			</select>'
	html += '		</td>'
	html += '		<td class="right">'
	html += '			<input type="text" value="000" name="moip_parcelas[\''+module_row+'\'][juros]" title="Juros" />'
	html += '		</td>'
	html += '		<td class="left"><a onclick="$(\'#module-row'+module_row+'\').remove();" class="button"><?php echo $button_remover ?></a></td>'
	html += '	</tr>'
	html += '</tbody>'
	
	module_row++;
	
	$('#parcelas tfoot').before(html);
};
//--></script>
<?php echo $footer; ?>
