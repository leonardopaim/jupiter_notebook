set foreign_key_checks=0;

create table if not exists bordero (
  bordero_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  data date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  taxa decimal(6,2) not null default '0.00',
  primary key (bordero_id),
  key k_bordero_1 (empresa_id),
  key k_bordero_2 (conta_id),
  constraint fk_bordero_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_bordero_2 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists bordero_cheque (
  bordero_id int(11) not null default '0',
  cheque_id int(11) not null default '0',
  primary key (bordero_id,cheque_id),
  key k_bordero_cheque_1 (bordero_id),
  key k_bordero_cheque_2 (cheque_id),
  constraint fk_bordero_cheque_1 foreign key (bordero_id) references bordero (bordero_id),
  constraint fk_bordero_cheque_2 foreign key (cheque_id) references cheque (cheque_id)
) engine=innodb default charset=latin1;

create table if not exists caixa (
  caixa_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  pdv_id int(11) not null default '0',
  abertura_data_hora datetime not null default '0001-01-01 00:00:00',
  abertura_usuario_id int(11) not null default '0',
  fechamento_data_hora datetime not null default '0001-01-01 00:00:00',
  fechamento_usuario_id int(11) not null default '0',
  status int(1) not null default '0',
  saldo_inicial decimal(15,2) not null default '0.00',
  saldo_atual decimal(15,2) not null default '0.00',
  primary key (caixa_id),
  key k_caixa_1 (empresa_id),
  key k_caixa_2 (pdv_id),
  key k_caixa_3 (abertura_usuario_id),
  key k_caixa_4 (fechamento_usuario_id),
  constraint fk_caixa_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_caixa_2 foreign key (pdv_id) references pdv (pdv_id)
) engine=innodb default charset=latin1;

create table if not exists caixa_usuario (
  caixa_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  responsavel tinyint(1) not null default '0',
  primary key (caixa_id,usuario_id),
  key k_caixa_usuario_1 (caixa_id),
  key k_caixa_usuario_2 (usuario_id),
  constraint fk_caixa_usuario_1 foreign key (caixa_id) references caixa (caixa_id)
) engine=innodb default charset=latin1;

create table if not exists caixa_valor (
  caixa_id int(11) not null default '0',
  forma_pagamento_id int(11) not null default '0',
  valor_apurado decimal(15,2) not null default '0.00',
  valor_informado decimal(15,2) not null default '0.00',
  primary key (caixa_id,forma_pagamento_id),
  key f_caixa_valor_1 (caixa_id),
  key f_caixa_valor_2 (forma_pagamento_id),
  constraint fk_caixa_valor_1 foreign key (caixa_id) references caixa (caixa_id),
  constraint fk_caixa_valor_2 foreign key (forma_pagamento_id) references forma_pagamento (forma_pagamento_id)
) engine=innodb default charset=latin1;

create table if not exists cartao (
  cartao_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  adquirente_id int(11) not null default '0',
  bandeira_id int(11) not null default '0',
  emissor_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  taxa decimal(6,2) not null default '0.00',
  data_transacao date not null default '0001-01-01',
  data_recebimento date not null default '0001-01-01',
  parcelamento int(1) not null default '0',
  parcelas int(3) not null default '0',
  nsu varchar(50) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (cartao_id),
  unique key uk_cartao_1 (nsu),
  key k_cartao_1 (empresa_id),
  key k_cartao_2 (adquirente_id),
  key k_cartao_3 (bandeira_id),
  key k_cartao_4 (emissor_id),
  constraint fk_cartao_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists cartao_credito (
  cartao_credito_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  nome varchar(100) not null default '',
  limite decimal(15,2) not null default '0.00',
  fechamento int(2) not null default '0',
  vencimento int(2) not null default '0',
  conta_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (cartao_credito_id),
  key k_cartao_credito_1 (empresa_id),
  key k_cartao_credito_2 (conta_id),
  constraint fk_cartao_credito_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_cartao_credito_2 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists cartao_credito_anexo (
  cartao_credito_anexo_id int(11) not null auto_increment,
  cartao_credito_movimento_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  primary key (cartao_credito_anexo_id),
  key k_cartao_credito_anexo_1 (cartao_credito_movimento_id),
  constraint fk_cartao_credito_anexo_1 foreign key (cartao_credito_movimento_id) references cartao_credito_movimento (cartao_credito_movimento_id)
) engine=innodb default charset=latin1;

create table if not exists cartao_credito_categoria (
  cartao_credito_movimento_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (cartao_credito_movimento_id,categoria_id),
  key k_cartao_credito_categoria_1 (cartao_credito_movimento_id),
  key k_cartao_credito_categoria_2 (categoria_id),
  constraint fk_cartao_credito_categoria_1 foreign key (cartao_credito_movimento_id) references cartao_credito_movimento (cartao_credito_movimento_id),
  constraint fk_cartao_credito_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists cartao_credito_centro_resultado (
  cartao_credito_movimento_id int(11) not null default '0',
  centro_resultado_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (cartao_credito_movimento_id,centro_resultado_id),
  key k_cartao_credito_centro_resultado_1 (cartao_credito_movimento_id),
  key k_cartao_credito_centro_resultado_2 (centro_resultado_id),
  constraint fk_cartao_credito_centro_resultado_1 foreign key (cartao_credito_movimento_id) references cartao_credito_movimento (cartao_credito_movimento_id),
  constraint fk_cartao_credito_centro_resultado_2 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id)
) engine=innodb default charset=latin1;

create table if not exists cartao_credito_fatura (
  cartao_credito_fatura_id int(11) not null auto_increment,
  cartao_credito_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  mes char(6) not null default '',
  vencimento date not null default '0001-01-01',
  pagamento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  fechada tinyint(1) not null default '0',
  primary key (cartao_credito_fatura_id),
  unique key uk_cartao_credito_fatura_1 (cartao_credito_id,mes),
  key k_cartao_credito_fatura_1 (cartao_credito_id),
  key k_cartao_credito_fatura_2 (conta_id),
  constraint fk_cartao_credito_fatura_1 foreign key (cartao_credito_id) references cartao_credito (cartao_credito_id),
  constraint fk_cartao_credito_fatura_2 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists cartao_credito_movimento (
  cartao_credito_movimento_id int(11) not null auto_increment,
  cartao_credito_fatura_id int(11) not null default '0',
  fornecedor_id int(11) default null,
  compra_id int(11) default null,
  data date not null default '0001-01-01',
  descricao varchar(200) not null default '',
  valor decimal(15,2) not null default '0.00',
  credito_debito char(1) not null default '',
  primary key (cartao_credito_movimento_id),
  key k_cartao_credito_movimento_1 (cartao_credito_fatura_id),
  key k_cartao_credito_movimento_2 (fornecedor_id),
  key k_cartao_credito_movimento_3 (compra_id),
  constraint fk_cartao_credito_movimento_1 foreign key (cartao_credito_fatura_id) references cartao_credito_fatura (cartao_credito_fatura_id),
  constraint fk_cartao_credito_movimento_2 foreign key (fornecedor_id) references pessoa (pessoa_id),
  constraint fk_cartao_credito_movimento_3 foreign key (compra_id) references compra (compra_id)
) engine=innodb default charset=latin1;

create table if not exists categoria (
  categoria_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  codigo varchar(30) not null default '',
  nome varchar(100) not null default '',
  categoria_grupo_id int(11) default null,
  credito_debito char(1) not null default '',
  analitica_sintetica char(1) not null default '',
  nivel int(2) not null default '0',
  primary key (categoria_id),
  unique key uk_categoria_1 (codigo_interno),
  key k_categoria_1 (categoria_grupo_id),
  constraint fk_categoria_1 foreign key (categoria_grupo_id) references categoria_grupo (categoria_grupo_id)
) engine=innodb default charset=latin1;

create trigger bi_categoria before insert on categoria for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nome';
	end if;
	if new.categoria_grupo_id <= 0 and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.categoria_grupo_id > 0 and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.credito_debito not in ('c','d') and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.credito_debito <> '' and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nivel';
	end if;
end;

create trigger bu_categoria before update on categoria for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nome';
	end if;
	if new.categoria_grupo_id <= 0 and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.categoria_grupo_id > 0 and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.credito_debito not in ('c','d') and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.credito_debito <> '' and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nivel';
	end if;
end;

create table if not exists categoria_centro_resultado (
  categoria_id int(11) not null default '0',
  centro_resultado_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (categoria_id,centro_resultado_id,empresa_id),
  key k_categoria_centro_resultado_1 (categoria_id),
  key k_categoria_centro_resultado_2 (centro_resultado_id),
  key k_categoria_centro_resultado_3 (empresa_id),
  constraint fk_categoria_centro_resultado_1 foreign key (categoria_id) references categoria (categoria_id),
  constraint fk_categoria_centro_resultado_2 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id),
  constraint fk_categoria_centro_resultado_3 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists categoria_empresa (
  categoria_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  conta_cartao_id int(11) default null,
  credito_debito_conta_cartao char(1) not null default '',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (categoria_id,empresa_id),
  key k_categoria_empresa_1 (categoria_id),
  key k_categoria_empresa_2 (empresa_id),
  key k_categoria_empresa_3 (conta_cartao_id),
  constraint fk_categoria_empresa_1 foreign key (categoria_id) references categoria (categoria_id),
  constraint fk_categoria_empresa_2 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_categoria_empresa_3 foreign key (conta_cartao_id) references conta_cartao (conta_cartao_id)
) engine=innodb default charset=latin1;

create table if not exists categoria_grupo (
  categoria_grupo_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  codigo varchar(30) not null default '',
  nome varchar(100) not null default '',
  credito_debito char(1) not null default '',
  primary key (categoria_grupo_id),
  unique key uk_categoria_grupo_1 (codigo_interno)
) engine=innodb default charset=latin1;

create trigger bi_categoria_grupo before insert on categoria_grupo for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.nome';
	end if;
	if new.credito_debito not in ('c','d') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.credito_debito';
	end if;
end;

create trigger bu_categoria_grupo before update on categoria_grupo for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.nome';
	end if;
	if new.credito_debito not in ('c','d') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.credito_debito';
	end if;
end;

create table if not exists categoria_grupo_conta_contabil (
  categoria_grupo_id int(11) not null default '0',
  conta_contabil_id int(11) not null default '0',
  origem int(2) not null default '0',
  saldo int(1) not null default '0',
  valor int(1) not null default '0',
  regime int(1) not null default '0',
  primary key (categoria_grupo_id,conta_contabil_id,origem,regime),
  key k_categoria_grupo_conta_contabil_1 (categoria_grupo_id),
  key k_categoria_grupo_conta_contabil_2 (conta_contabil_id),
  constraint fk_categoria_grupo_conta_contabil_1 foreign key (categoria_grupo_id) references categoria_grupo (categoria_grupo_id),
  constraint fk_categoria_grupo_conta_contabil_2 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists centro_resultado (
  centro_resultado_id int(11) not null auto_increment,
  nome varchar(100) not null default '',
  centro_resultado_integracao varchar(30) not null default '',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (centro_resultado_id)
) engine=innodb default charset=latin1;

create trigger bi_centro_resultado before insert on centro_resultado for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.nome';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.excluido';
    end if;
end;

create trigger bu_centro_resultado before update on centro_resultado for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.nome';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.excluido';
    end if;
end;

create table if not exists centro_resultado_empresa (
  centro_resultado_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  primary key (centro_resultado_id,empresa_id),
  key k_centro_resultado_empresa_1 (centro_resultado_id),
  key k_centro_resultado_empresa_2 (empresa_id),
  constraint fk_centro_resultado_empresa_1 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id),
  constraint fk_centro_resultado_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists cfe_mfe (
  cfe_mfe_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  primary key (cfe_mfe_id),
  key k_cfe_mfe_1 (empresa_id),
  constraint fk_cfe_mfe_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists cfe_mfe_item (
  cfe_mfe_item_id int(11) not null auto_increment,
  cfe_mfe_id int(11) not null default '0',
  primary key (cfe_mfe_item_id),
  key k_cfe_mfe_item_1 (cfe_mfe_id),
  constraint fk_cfe_mfe_item_1 foreign key (cfe_mfe_id) references cfe_mfe (cfe_mfe_id)
) engine=innodb default charset=latin1;

create table if not exists cfe_sat (
  cfe_sat_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  primary key (cfe_sat_id),
  key k_cfe_sat_1 (empresa_id),
  constraint fk_cfe_sat_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists cfe_sat_item (
  cfe_sat_item_id int(11) not null auto_increment,
  cfe_sat_id int(11) not null default '0',
  primary key (cfe_sat_item_id),
  key k_cfe_sat_item_1 (cfe_sat_id),
  constraint fk_cfe_sat_item_1 foreign key (cfe_sat_id) references cfe_sat (cfe_sat_id)
) engine=innodb default charset=latin1;

create table if not exists cheque (
  cheque_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  pessoa_id int(11) not null default '0',
  emitente_id int(11) not null default '0',
  banco int(3) not null default '0',
  agencia varchar(15) not null default '',
  conta varchar(15) not null default '',
  numero varchar(15) not null default '',
  valor decimal(15,2) not null default '0.00',
  emissao date not null default '0001-01-01',
  vencimento date not null default '0001-01-01',
  pagamento date not null default '0001-01-01',
  emitido_recebido char(1) not null default '',
  url_cheque varchar(500) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (cheque_id),
  unique key uk_cheque_1 (banco,agencia,conta,numero),
  key k_cheque_1 (empresa_id),
  key k_cheque_2 (conta_id),
  key k_cheque_3 (pessoa_id),
  key k_cheque_4 (emitente_id),
  constraint fk_cheque_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_cheque_2 foreign key (conta_id) references conta (conta_id),
  constraint fk_cheque_3 foreign key (pessoa_id) references pessoa (pessoa_id),
  constraint fk_cheque_4 foreign key (emitente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_certificado (
  cliente_certificado_id int(11) not null auto_increment,
  cliente_id int(11) not null default '0',
  signatario varchar(100) not null default '',
  cpf_cnpj varchar(20) not null default '',
  validade date not null default '0001-01-01',
  senha varchar(50) not null default '',
  url_certificado varchar(500) not null default '',
  primary key (cliente_certificado_id),
  key k_cliente_certificado_1 (cliente_id),
  constraint fk_cliente_certificado_1 foreign key (cliente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_cnae (
  cliente_cnae_id int(11) not null auto_increment,
  cliente_id int(11) not null default '0',
  codigo varchar(20) not null default '',
  descricao varchar(100) not null default '',
  primary key (cliente_cnae_id),
  unique key uk_cliente_cnae_1 (cliente_id,codigo),
  key k_cliente_cnae_1 (cliente_id),
  constraint fk_cliente_cnae_1 foreign key (cliente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_contrato (
  cliente_contrato_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  cliente_id int(11) not null default '0',
  parceiro_contrato_id int(11) default null,
  servico_id int(11) not null default '0',
  produto_id int(11) default null,
  conta_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  sla_id int(11) default null,
  data_inicio date not null default '0001-01-01',
  data_fim date not null default '0001-01-01',
  data_ultimo_reajuste date not null default '0001-01-01',
  data_ultimo_faturamento date not null default '0001-01-01',
  dia_vencimento int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  percentual decimal(8,4) not null default '0.0000',
  desconto decimal(8,4) not null default '0.0000',
  indice_reajuste int(1) not null default '0',
  faturamento_tipo int(1) not null default '0',
  faturamento_calculo int(1) not null default '0',
  faturamento_periodicidade int(1) not null default '0',
  documento_receber int(1) not null default '0',
  documento_fiscal int(1) not null default '0',
  parceiro_atendimento int(1) not null default '0',
  parceiro_faturamento int(1) not null default '0',
  parceiro_financeiro int(1) not null default '0',
  parceiro_remuneracao int(1) not null default '0',
  parceiro_percentual decimal(8,4) not null default '0.0000',
  observacao text not null,
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (cliente_contrato_id),
  key k_cliente_contrato_1 (empresa_id),
  key k_cliente_contrato_2 (cliente_id),
  key k_cliente_contrato_4 (servico_id),
  key k_cliente_contrato_5 (produto_id),
  key k_cliente_contrato_6 (conta_id),
  key k_cliente_contrato_7 (categoria_id),
  key k_cliente_contrato_8 (sla_id),
  key k_cliente_contrato_3 (parceiro_contrato_id),
  constraint fk_cliente_contrato_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_cliente_contrato_2 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_cliente_contrato_3 foreign key (parceiro_contrato_id) references parceiro_contrato (parceiro_contrato_id),
  constraint fk_cliente_contrato_4 foreign key (servico_id) references produto (produto_id),
  constraint fk_cliente_contrato_5 foreign key (produto_id) references produto (produto_id),
  constraint fk_cliente_contrato_6 foreign key (conta_id) references conta (conta_id),
  constraint fk_cliente_contrato_7 foreign key (categoria_id) references categoria (categoria_id),
  constraint fk_cliente_contrato_8 foreign key (sla_id) references sla (sla_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_contrato_anexo (
  cliente_contrato_anexo_id int(11) not null auto_increment,
  cliente_contrato_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  primary key (cliente_contrato_anexo_id),
  key k_cliente_contrato_anexo_1 (cliente_contrato_id),
  constraint fk_cliente_contrato_anexo_1 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_contrato_atividade (
  cliente_contrato_atividade_id int(11) not null auto_increment,
  cliente_contrato_id int(11) not null default '0',
  assinatura_id int(11) default null,
  usuario_id int(11) default null,
  data_hora datetime not null default '0001-01-01 00:00:00',
  atividade int(2) not null default '0',
  descricao varchar(200) not null default '',
  valor decimal(15,2) not null default '0.00',
  percentual decimal(8,4) not null default '0.0000',
  desconto decimal(8,4) not null default '0.0000',
  carencia_data_inicio date not null default '0001-01-01',
  carencia_data_fim date not null default '0001-01-01',
  modulo_id int(11) not null default '0',
  usuarios int(4) not null default '0',
  cliente_contrato_motivo_cancelamento_id int(11) default null,
  primary key (cliente_contrato_atividade_id),
  key k_cliente_contrato_atividade_1 (cliente_contrato_id),
  key k_cliente_contrato_atividade_2 (assinatura_id),
  key k_cliente_contrato_atividade_3 (usuario_id),
  key k_cliente_contrato_atividade_4 (cliente_contrato_motivo_cancelamento_id),
  constraint fk_cliente_contrato_atividade_1 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id),
  constraint fk_cliente_contrato_atividade_4 foreign key (cliente_contrato_motivo_cancelamento_id) references cliente_contrato_motivo_cancelamento (cliente_contrato_motivo_cancelamento_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_contrato_carencia (
  cliente_contrato_carencia_id int(11) not null auto_increment,
  cliente_contrato_id int(11) not null default '0',
  data_inicio date not null default '0001-01-01',
  data_fim date not null default '0001-01-01',
  primary key (cliente_contrato_carencia_id),
  key k_cliente_contrato_carencia_1 (cliente_contrato_id),
  constraint fk_cliente_contrato_carencia_1 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_contrato_motivo_cancelamento (
  cliente_contrato_motivo_cancelamento_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  primary key (cliente_contrato_motivo_cancelamento_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_contrato_motivo_cancelamento_empresa (
  cliente_contrato_motivo_cancelamento_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  assinatura tinyint(1) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (cliente_contrato_motivo_cancelamento_id,empresa_id),
  key k_cliente_contrato_motivo_cancelamento_empresa_1 (cliente_contrato_motivo_cancelamento_id),
  key k_cliente_contrato_motivo_cancelamento_empresa_2 (empresa_id),
  constraint fk_cliente_contrato_motivo_cancelamento_empresa_1 foreign key (cliente_contrato_motivo_cancelamento_id) references cliente_contrato_motivo_cancelamento (cliente_contrato_motivo_cancelamento_id),
  constraint fk_cliente_contrato_motivo_cancelamento_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_credito (
  cliente_credito_id int(11) not null auto_increment,
  cliente_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  venda_id int(11) default null,
  devolucao_venda_id int(11) default null,
  recebimento_id int(11) default null,
  recebimento_cancelado_id int(11) default null,
  faturamento_id int(11) default null,
  data_hora datetime not null default '0001-01-01 00:00:00',
  valor decimal(15,2) not null default '0.00',
  credito_debito char(1) not null default '',
  primary key (cliente_credito_id),
  key k_cliente_credito_1 (cliente_id),
  key k_cliente_credito_2 (empresa_id),
  key k_cliente_credito_3 (venda_id),
  key k_cliente_credito_4 (devolucao_venda_id),
  key k_cliente_credito_5 (recebimento_id),
  key k_cliente_credito_6 (recebimento_cancelado_id),
  key k_cliente_credito_7 (faturamento_id),
  constraint fk_cliente_credito_1 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_cliente_credito_2 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_cliente_credito_3 foreign key (venda_id) references venda (venda_id),
  constraint fk_cliente_credito_4 foreign key (devolucao_venda_id) references devolucao_venda (devolucao_venda_id),
  constraint fk_cliente_credito_5 foreign key (recebimento_id) references recebimento (recebimento_id),
  constraint fk_cliente_credito_6 foreign key (recebimento_cancelado_id) references recebimento_cancelado (recebimento_cancelado_id),
  constraint fk_cliente_credito_7 foreign key (faturamento_id) references faturamento (faturamento_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_departamento (
  cliente_id int(11) not null default '0',
  departamento_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  primary key (cliente_id,departamento_id),
  key k_cliente_departamento_1 (cliente_id),
  key k_cliente_departamento_2 (departamento_id),
  key k_cliente_departamento_3 (colaborador_id),
  constraint fk_cliente_departamento_1 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_cliente_departamento_2 foreign key (departamento_id) references departamento (departamento_id),
  constraint fk_cliente_departamento_3 foreign key (colaborador_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_infraestrutura (
  cliente_infraestrutura_id int(11) not null auto_increment,
  cliente_id int(11) not null default '0',
  descricao varchar(500) not null default '',
  url_anexo varchar(500) not null default '',
  primary key (cliente_infraestrutura_id),
  key k_cliente_infraestrutura_1 (cliente_id),
  constraint fk_cliente_infraestrutura_1 foreign key (cliente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_infraestrutura_tag (
  cliente_infraestrutura_id int(11) not null default '0',
  tag_id int(11) not null default '0',
  primary key (cliente_infraestrutura_id,tag_id),
  key k_cliente_infraestrutura_tag_1 (cliente_infraestrutura_id),
  key k_cliente_infraestrutura_tag_2 (tag_id),
  constraint fk_cliente_infraestrutura_tag_1 foreign key (cliente_infraestrutura_id) references cliente_infraestrutura (cliente_infraestrutura_id),
  constraint fk_cliente_infraestrutura_tag_2 foreign key (tag_id) references tag (tag_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_senha (
  cliente_senha_id int(11) not null auto_increment,
  cliente_id int(11) not null default '0',
  servico varchar(100) not null default '',
  link varchar(200) not null default '',
  usuario varchar(50) not null default '',
  senha varchar(50) not null default '',
  observacao text not null,
  primary key (cliente_senha_id),
  key k_cliente_senha_1 (cliente_id),
  constraint fk_cliente_senha_1 foreign key (cliente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists cliente_solicitante (
  cliente_id int(11) not null default '0',
  solicitante_id int(11) not null default '0',
  primary key (cliente_id,solicitante_id),
  key k_cliente_solicitante_1 (cliente_id),
  key k_cliente_solicitante_2 (solicitante_id),
  constraint fk_cliente_solicitante_1 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_cliente_solicitante_2 foreign key (solicitante_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists colaborador_cargo (
  colaborador_cargo_id int(11) not null auto_increment,
  nome varchar(100) not null default '',
  salario decimal(15,2) not null default '0.00',
  primary key (colaborador_cargo_id)
) engine=innodb default charset=latin1;

create table if not exists colaborador_cargo_empresa (
  colaborador_cargo_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (colaborador_cargo_id,empresa_id),
  key k_colaborador_cargo_empresa_1 (colaborador_cargo_id),
  key k_colaborador_cargo_empresa_2 (empresa_id),
  constraint fk_colaborador_cargo_empresa_1 foreign key (colaborador_cargo_id) references colaborador_cargo (colaborador_cargo_id),
  constraint fk_colaborador_cargo_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists colaborador_contrato (
  colaborador_contrato_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  centro_resultado_id int(11) default null,
  colaborador_cargo_id int(11) default null,
  admissao_data date not null default '0001-01-01',
  demissao_data date not null default '0001-01-01',
  demissao_causa varchar(200) not null default '',
  salario decimal(15,2) not null default '0.00',
  primary key (colaborador_contrato_id),
  key k_colaborador_contrato_1 (empresa_id),
  key k_colaborador_contrato_2 (colaborador_id),
  key k_colaborador_contrato_3 (centro_resultado_id),
  key k_colaborador_contrato_4 (colaborador_cargo_id),
  constraint fk_colaborador_contrato_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_colaborador_contrato_2 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_colaborador_contrato_3 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id),
  constraint fk_colaborador_contrato_4 foreign key (colaborador_cargo_id) references colaborador_cargo (colaborador_cargo_id)
) engine=innodb default charset=latin1;

create table if not exists colaborador_contrato_horario (
  colaborador_contrato_id int(11) not null auto_increment,
  dia_semana int(1) not null default '0',
  hora_inicial time not null default '00:00:00',
  hora_intervalo_inicial time not null default '00:00:00',
  hora_intervalo_final time not null default '00:00:00',
  hora_final time not null default '00:00:00',
  primary key (colaborador_contrato_id,dia_semana),
  key k_colaborador_contrato_horario_1 (colaborador_contrato_id),
  constraint fk_colaborador_contrato_horario_1 foreign key (colaborador_contrato_id) references colaborador_contrato (colaborador_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists colaborador_lancamento_auto (
  colaborador_lancamento_auto_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  folha_pagamento_evento_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  forma_pagamento_id int(11) not null default '0',
  centro_resultado_id int(11) default null,
  lancamento_vencimento_id int(11) default null,
  descricao varchar(200) not null default '',
  percentual_salario decimal(8,4) not null default '0.0000',
  valor decimal(15,2) not null default '0.00',
  dia_lancamento int(2) not null default '0',
  mes_lancamento int(1) not null default '0',
  primary key (colaborador_lancamento_auto_id),
  unique key uk_colaborador_lancamento_auto_1 (empresa_id,folha_pagamento_evento_id,colaborador_id,conta_id),
  key k_colaborador_lancamento_auto_1 (empresa_id),
  key k_colaborador_lancamento_auto_2 (folha_pagamento_evento_id),
  key k_colaborador_lancamento_auto_3 (colaborador_id),
  key k_colaborador_lancamento_auto_4 (conta_id),
  key k_colaborador_lancamento_auto_5 (forma_pagamento_id),
  key k_colaborador_lancamento_auto_6 (centro_resultado_id),
  key k_colaborador_lancamento_auto_7 (lancamento_vencimento_id),
  constraint fk_colaborador_lancamento_auto_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_colaborador_lancamento_auto_2 foreign key (folha_pagamento_evento_id) references folha_pagamento_evento (folha_pagamento_evento_id),
  constraint fk_colaborador_lancamento_auto_3 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_colaborador_lancamento_auto_4 foreign key (conta_id) references conta (conta_id),
  constraint fk_colaborador_lancamento_auto_5 foreign key (forma_pagamento_id) references forma_pagamento (forma_pagamento_id),
  constraint fk_colaborador_lancamento_auto_6 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id),
  constraint fk_colaborador_lancamento_auto_7 foreign key (lancamento_vencimento_id) references colaborador_lancamento_auto (colaborador_lancamento_auto_id)
) engine=innodb default charset=latin1;

create table if not exists compra (
  compra_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  numero int(11) not null default '0',
  operacao_id int(11) not null default '0',
  fornecedor_id int(11) not null default '0',
  tipo_frete int(1) not null default '0',
  transportador_id int(11) default null,
  data_entrada date not null default '0001-01-01',
  pagamento int(1) not null default '0',
  quantidade_parcelas int(3) not null default '0',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  valor_impostos decimal(15,2) not null default '0.00',
  estoque_id int(11) not null default '0',
  observacao text not null,
  cancelada tinyint(1) not null default '0',
  devolvida tinyint(1) not null default '0',
  nfe_id int(11) default null,
  nf_id int(11) default null,
  primary key (compra_id),
  key k_compra_1 (empresa_id),
  key k_compra_2 (operacao_id),
  key k_compra_3 (fornecedor_id),
  key k_compra_4 (transportador_id),
  key k_compra_5 (estoque_id),
  key k_compra_6 (nfe_id),
  key k_compra_7 (nf_id),
  constraint fk_compra_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_compra_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_compra_3 foreign key (fornecedor_id) references pessoa (pessoa_id),
  constraint fk_compra_4 foreign key (transportador_id) references pessoa (pessoa_id),
  constraint fk_compra_5 foreign key (estoque_id) references estoque (estoque_id),
  constraint fk_compra_6 foreign key (nfe_id) references nfe (nfe_id),
  constraint fk_compra_7 foreign key (nf_id) references nf (nf_id)
) engine=innodb default charset=latin1;

create table if not exists compra_item (
  compra_item_id int(11) not null auto_increment,
  compra_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  preco_custo_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  valor_impostos decimal(15,2) not null default '0.00',
  nfe_item_id int(11) default null,
  nf_item_id int(11) default null,
  primary key (compra_item_id),
  key k_compra_item_1 (compra_id),
  key k_compra_item_2 (produto_id),
  key k_compra_item_3 (produto_grade_id),
  key k_compra_item_4 (produto_lote_id),
  key k_compra_item_5 (nfe_item_id),
  key k_compra_item_6 (nf_item_id),
  constraint fk_compra_item_1 foreign key (compra_id) references compra (compra_id),
  constraint fk_compra_item_2 foreign key (produto_id) references produto (produto_id),
  constraint fk_compra_item_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_compra_item_4 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_compra_item_5 foreign key (nfe_item_id) references nfe_item (nfe_item_id),
  constraint fk_compra_item_6 foreign key (nf_item_id) references nf_item (nf_item_id)
) engine=innodb default charset=latin1;

create table if not exists compra_pendente (
  compra_pendente_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  operacao_id int(11) default null,
  chave_acesso varchar(44) not null default '',
  numero int(11) not null default '0',
  fornecedor_id int(11) not null default '0',
  tipo_frete int(2) not null default '0',
  transportador_id int(11) default null,
  data_emissao date not null default '0001-01-01',
  data_entrada date not null default '0001-01-01',
  serie int(3) not null default '0',
  modelo char(3) not null default '',
  pagamento int(1) not null default '0',
  quantidade_parcelas int(3) not null default '0',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  base_calculo_icms decimal(15,2) not null default '0.00',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  valor_icms_st decimal(15,2) not null default '0.00',
  base_calculo_ipi decimal(15,2) not null default '0.00',
  valor_ipi decimal(15,2) not null default '0.00',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_icms_st_retido decimal(15,2) not null default '0.00',
  valor_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_icms_retido decimal(15,2) not null default '0.00',
  valor_icms_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st decimal(15,2) not null default '0.00',
  valor_fcp_icms_st decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  url_xml varchar(500) not null default '',
  estoque_id int(11) default null,
  observacao text not null,
  observacao_fisco text not null,
  primary key (compra_pendente_id),
  key k_compra_pendente_1 (empresa_id),
  key k_compra_pendente_2 (operacao_id),
  key k_compra_pendente_3 (fornecedor_id),
  key k_compra_pendente_4 (transportador_id),
  key k_compra_pendente_5 (estoque_id),
  constraint fk_compra_pendente_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_compra_pendente_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_compra_pendente_3 foreign key (fornecedor_id) references pessoa (pessoa_id),
  constraint fk_compra_pendente_4 foreign key (transportador_id) references pessoa (pessoa_id),
  constraint fk_compra_pendente_5 foreign key (estoque_id) references estoque (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists compra_pendente_item (
  compra_pendente_item_id int(11) not null auto_increment,
  compra_pendente_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  cfop int(4) not null default '0',
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  preco_custo_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  cst_icms char(3) not null default '',
  base_calculo_icms decimal(15,2) not null default '0.00',
  aliquota_icms decimal(8,4) not null default '0.0000',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  valor_icms_st decimal(15,2) not null default '0.00',
  cst_ipi char(3) not null default '',
  base_calculo_ipi decimal(15,2) not null default '0.00',
  aliquota_ipi decimal(8,4) not null default '0.0000',
  valor_ipi decimal(15,2) not null default '0.00',
  cst_pis_cofins char(3) not null default '',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_icms_st_retido decimal(15,2) not null default '0.00',
  aliquota_icms_st_retido decimal(8,4) not null default '0.0000',
  valor_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_icms_retido decimal(15,2) not null default '0.00',
  aliquota_icms_retido decimal(8,4) not null default '0.0000',
  valor_icms_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st_retido decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  percentual_fcp_icms decimal(8,4) not null default '0.0000',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  codigo_credito_pis_cofins int(3) not null default '0',
  natureza_bc_c_pis_cofins int(3) not null default '0',
  conta_contabil_id int(11) default null,
  primary key (compra_pendente_item_id),
  key k_compra_pendente_item_1 (compra_pendente_id),
  key k_compra_pendente_item_2 (produto_id),
  key k_compra_pendente_item_3 (produto_grade_id),
  key k_compra_pendente_item_4 (produto_lote_id),
  key k_compra_pendente_item_5 (conta_contabil_id),
  constraint fk_compra_pendente_item_1 foreign key (compra_pendente_id) references compra_pendente (compra_pendente_id),
  constraint fk_compra_pendente_item_2 foreign key (produto_id) references produto (produto_id),
  constraint fk_compra_pendente_item_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_compra_pendente_item_4 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_compra_pendente_item_5 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists compromisso (
  compromisso_id int(11) not null auto_increment,
  usuario_id int(11) not null default '0',
  descricao varchar(300) not null default '',
  data_hora_inicio datetime not null default '0001-01-01 00:00:00',
  data_hora_fim datetime not null default '0001-01-01 00:00:00',
  concluido tinyint(1) not null default '0',
  tarefa_id int(11) default null,
  excluido tinyint(1) not null default '0',
  primary key (compromisso_id),
  unique key uk_compromisso_1 (tarefa_id),
  key k_compromisso_1 (usuario_id),
  constraint fk_compromisso_1 foreign key (tarefa_id) references tarefa (tarefa_id)
) engine=innodb default charset=latin1;

create table if not exists compromisso_notificacao (
  compromisso_notificacao_id int(11) not null auto_increment,
  compromisso_id int(11) not null default '0',
  job_id int(11) not null default '0',
  tipo int(1) not null default '0',
  tempo int(3) not null default '0',
  metrica int(1) not null default '0',
  destino varchar(300) not null default '',
  primary key (compromisso_notificacao_id),
  key k_compromisso_notificacao_1 (compromisso_id),
  constraint fk_compromisso_notificacao_1 foreign key (compromisso_id) references compromisso (compromisso_id)
) engine=innodb default charset=latin1;

create table if not exists configuracao (
  empresa_id int(11) not null default '0',
  regime_tributario int(1) not null default '0',
  regime_tributario_especial int(1) not null default '0',
  incentivo_fiscal tinyint(1) not null default '0',
  certificado_a1 varchar(150) not null default '',
  certificado_a1_senha varchar(100) not null default '',
  salario_minimo decimal(15,2) not null default '0.00',
  cliente_contrato_conta_id int(11) default null,
  cliente_contrato_categoria_id int(11) default null,
  importacao_retorno_forma_pagamento_id int(11) default null,
  juros_diario decimal(8,4) not null default '0.0000',
  juros_carencia int(4) not null default '0',
  juros_calculo int(1) not null default '0',
  multa decimal(8,4) not null default '0.0000',
  multa_carencia int(4) not null default '0',
  crm_dias_reserva_conta int(3) not null default '0',
  crm_pipeline_periodo int(1) not null default '0',
  crm_pipeline_multiplicador_meta decimal(8,4) not null default '0.0000',
  crm_pipeline_fase_inicial int(11) not null default '0',
  crm_pipeline_temperatura_inicial int(2) not null default '0',
  faturamento_operacao_id int(11) default null,
  nfse_gateway int(1) not null default '0',
  nfse_numero_lote int(11) not null default '0',
  orcamento_sem_estoque int(1) not null default '0',
  pedido_sem_estoque int(1) not null default '0',
  venda_operacao_id int(11) default null,
  venda_sem_estoque int(1) not null default '0',
  nfce_csc_token varchar(50) not null default '',
  nfce_csc_id varchar(20) not null default '',
  ordem_servico_modelo int(1) not null default '0',
  conta_corrente_conta_contabil_id int(11) default null,
  inventario_conta_contabil_id int(11) default null,
  integracao_contabil_layout int(2) not null default '0',
  integracao_contabil_dia_envio int(2) not null default '0',
  integracao_contabil_bloqueia_lancamento tinyint(1) not null default '0',
  sintegra_responsavel_nome varchar(50) not null default '',
  pdv_venda_operacao_id int(11) default null,
  pdv_sangria_categoria_id int(11) default null,
  pdv_suprimento_categoria_id int(11) default null,
  servicedesk_clientes int(1) not null default '0',
  cadastro_cliente_obrigatorio_cpf tinyint(1) not null default '0',
  cadastro_cliente_obrigatorio_rg tinyint(1) not null default '0',
  cadastro_cliente_obrigatorio_cnpj tinyint(1) not null default '0',
  cadastro_cliente_obrigatorio_ie tinyint(1) not null default '0',
  cadastro_fornecedor_obrigatorio_cpf tinyint(1) not null default '0',
  cadastro_fornecedor_obrigatorio_rg tinyint(1) not null default '0',
  cadastro_fornecedor_obrigatorio_cnpj tinyint(1) not null default '0',
  cadastro_fornecedor_obrigatorio_ie tinyint(1) not null default '0',
  primary key (empresa_id),
  key k_configuracao_2 (cliente_contrato_conta_id),
  key k_configuracao_3 (cliente_contrato_categoria_id),
  key k_configuracao_4 (importacao_retorno_forma_pagamento_id),
  key k_configuracao_5 (faturamento_operacao_id),
  key k_configuracao_6 (venda_operacao_id),
  key k_configuracao_7 (conta_corrente_conta_contabil_id),
  key k_configuracao_8 (inventario_conta_contabil_id),
  key k_configuracao_9 (pdv_venda_operacao_id),
  key k_configuracao_10 (pdv_sangria_categoria_id),
  key k_configuracao_11 (pdv_suprimento_categoria_id),
  constraint fk_configuracao_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_configuracao_10 foreign key (pdv_sangria_categoria_id) references categoria (categoria_id),
  constraint fk_configuracao_11 foreign key (pdv_suprimento_categoria_id) references categoria (categoria_id),
  constraint fk_configuracao_2 foreign key (cliente_contrato_conta_id) references conta (conta_id),
  constraint fk_configuracao_3 foreign key (cliente_contrato_categoria_id) references categoria (categoria_id),
  constraint fk_configuracao_4 foreign key (importacao_retorno_forma_pagamento_id) references forma_pagamento (forma_pagamento_id),
  constraint fk_configuracao_5 foreign key (faturamento_operacao_id) references operacao (operacao_id),
  constraint fk_configuracao_6 foreign key (venda_operacao_id) references operacao (operacao_id),
  constraint fk_configuracao_7 foreign key (conta_corrente_conta_contabil_id) references conta_contabil (conta_contabil_id),
  constraint fk_configuracao_8 foreign key (inventario_conta_contabil_id) references conta_contabil (conta_contabil_id),
  constraint fk_configuracao_9 foreign key (pdv_venda_operacao_id) references operacao (operacao_id)
) engine=innodb default charset=latin1;

create table if not exists conta (
  conta_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  codigo_interno int(11) default null,
  instituicao_financeira_id int(11) not null default '0',
  nome varchar(100) not null default '',
  tipo int(2) not null default '0',
  saldo decimal(15,2) not null default '0.00',
  saldo_inicial decimal(15,2) not null default '0.00',
  data_saldo_inicial date not null default '0001-01-01',
  numero_agencia varchar(20) not null default '',
  numero_conta varchar(20) not null default '',
  numero_operacao char(3) not null default '',
  conta_contabil_id int(11) default null,
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (conta_id),
  unique key uk_conta_1 (empresa_id,codigo_interno),
  key k_conta_1 (empresa_id),
  key k_conta_2 (instituicao_financeira_id),
  key k_conta_3 (conta_contabil_id),
  constraint fk_conta_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_conta_3 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists conta_boleto (
  conta_id int(11) not null default '0',
  carteira varchar(20) not null default '',
  variacao_carteira varchar(20) not null default '',
  tipo_carteira int(1) not null default '0',
  forma_cadastramento int(1) not null default '0',
  impressao int(1) not null default '0',
  tipo int(1) not null default '0',
  distribuicao int(1) not null default '0',
  local_pagamento varchar(200) not null default '',
  mensagem varchar(200) not null default '',
  nosso_numero varchar(20) not null default '',
  layout_remessa int(1) not null default '0',
  codigo_cedente varchar(20) not null default '',
  cpf_cnpj_cedente varchar(20) not null default '',
  nome_razao_social_cedente varchar(100) not null default '',
  especie int(1) not null default '0',
  aceite tinyint(1) not null default '0',
  juros_diario decimal(8,4) not null default '0.0000',
  juros_carencia int(4) not null default '0',
  multa decimal(8,4) not null default '0.0000',
  multa_carencia int(4) not null default '0',
  primary key (conta_id),
  constraint fk_conta_boleto_1 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists conta_cartao (
  conta_cartao_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  adquirente_id int(11) not null default '0',
  bandeira_id int(11) not null default '0',
  emissor_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  taxa decimal(6,2) not null default '0.00',
  vencimento int(2) not null default '0',
  saldo decimal(15,2) not null default '0.00',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (conta_cartao_id),
  unique key uk_conta_cartao_1 (empresa_id,adquirente_id,bandeira_id),
  key k_conta_cartao_1 (empresa_id),
  key k_conta_cartao_2 (adquirente_id),
  key k_conta_cartao_3 (bandeira_id),
  key k_conta_cartao_4 (emissor_id),
  key k_conta_cartao_5 (conta_id),
  constraint fk_conta_cartao_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_conta_cartao_5 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists conta_cartao_saldo (
  conta_cartao_id int(11) not null default '0',
  data date not null default '0001-01-01',
  saldo decimal(15,2) not null default '0.00',
  primary key (conta_cartao_id,data),
  key k_conta_cartao_saldo_1 (conta_cartao_id),
  key k_conta_cartao_saldo_2 (data),
  constraint fk_conta_cartao_saldo_1 foreign key (conta_cartao_id) references conta_cartao (conta_cartao_id)
) engine=innodb default charset=latin1;

create table if not exists conta_contabil (
  conta_contabil_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  codigo varchar(30) not null default '',
  codigo_reduzido int(6) not null default '0',
  codigo_rfb varchar(30) not null default '',
  nome varchar(100) not null default '',
  natureza int(1) not null default '0',
  grupo int(1) not null default '0',
  analitica_sintetica char(1) not null default '',
  nivel int(2) not null default '0',
  primary key (conta_contabil_id),
  unique key uk_conta_contabil_1 (codigo_interno)
) engine=innodb default charset=latin1;

create trigger bi_conta_contabil before insert on conta_contabil for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo';
	end if;
	if new.codigo_reduzido <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo_reduzido';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nome';
	end if;
	if new.natureza not in (1,2) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.natureza';
	end if;
	if new.grupo not in (1,2,3,4) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.grupo';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nivel';
	end if;
end;

create trigger bu_conta_contabil before update on conta_contabil for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo';
	end if;
	if new.codigo_reduzido <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo_reduzido';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nome';
	end if;
	if new.natureza not in (1,2) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.natureza';
	end if;
	if new.grupo not in (1,2,3,4) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.grupo';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nivel';
	end if;
end;

create table if not exists conta_contabil_saldo (
  conta_contabil_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  mes char(6) not null default '',
  saldo decimal(15,2) not null default '0.00',
  regime int(1) not null default '0',
  primary key (conta_contabil_id,empresa_id,mes,regime),
  key k_conta_contabil_saldo_1 (conta_contabil_id),
  key k_conta_contabil_saldo_2 (empresa_id),
  constraint fk_conta_contabil_saldo_1 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id),
  constraint fk_conta_contabil_saldo_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create trigger bi_conta_contabil_saldo before insert on conta_contabil_saldo for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.mes';
    end if;
    if new.regime not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.regime';
    end if;
end;

create trigger bu_conta_contabil_saldo before update on conta_contabil_saldo for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.mes';
    end if;
    if new.regime not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.regime';
    end if;
end;

create table if not exists conta_saldo (
  conta_id int(11) not null default '0',
  data date not null default '0001-01-01',
  saldo decimal(15,2) not null default '0.00',
  primary key (conta_id,data),
  key k_conta_saldo_1 (conta_id),
  key k_conta_saldo_2 (data),
  constraint fk_conta_saldo_1 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists cte (
  cte_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  numero int(11) not null default '0',
  cfop int(4) not null default '0',
  modelo int(2) not null default '0',
  serie int(3) not null default '0',
  data_hora_emissao datetime not null default '0001-01-01 00:00:00',
  data_hora_prestacao datetime not null default '0001-01-01 00:00:00',
  tipo int(1) not null default '0',
  modal int(1) not null default '0',
  tipo_servico int(1) not null default '0',
  emitente int(1) not null default '0',
  inicio_codigo_municipio varchar(7) not null default '',
  inicio_municipio varchar(50) not null default '',
  inicio_uf char(2) not null default '',
  fim_codigo_municipio varchar(7) not null default '',
  fim_municipio varchar(50) not null default '',
  fim_uf char(2) not null default '',
  tipo_tomador int(1) not null default '0',
  tomador_id int(11) default null,
  remetente_id int(11) default null,
  expedidor_id int(11) default null,
  recebedor_id int(11) default null,
  destinatario_emitente_id int(11) default null,
  valor_total decimal(15,2) not null default '0.00',
  valor_receber decimal(15,2) not null default '0.00',
  cst_icms char(3) not null default '',
  reducao_base_calculo_icms decimal(8,4) not null default '0.0000',
  base_calculo_icms decimal(15,2) not null default '0.00',
  aliquota_icms decimal(8,4) not null default '0.0000',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  aliquota_icms_st decimal(8,4) not null default '0.0000',
  valor_icms_st decimal(15,2) not null default '0.00',
  valor_total_carga decimal(15,2) not null default '0.00',
  produto_predominante varchar(100) not null default '',
  caracteristicas_carga varchar(50) not null default '',
  fatura_numero varchar(60) not null default '',
  fatura_valor decimal(15,2) not null default '0.00',
  fatura_desconto decimal(15,2) not null default '0.00',
  chave_acesso varchar(44) not null default '',
  protocolo varchar(15) not null default '',
  recibo varchar(15) not null default '',
  url_xml varchar(500) not null default '',
  url_xml_cancelamento varchar(500) not null default '',
  observacao text not null,
  observacao_fisco text not null,
  conta_contabil_id int(11) default null,
  emitido tinyint(1) not null default '0',
  cancelado tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (cte_id),
  key k_cte_1 (empresa_id),
  key k_cte_2 (tomador_id),
  key k_cte_3 (remetente_id),
  key k_cte_4 (expedidor_id),
  key k_cte_5 (recebedor_id),
  key k_cte_6 (destinatario_emitente_id),
  key k_cte_7 (conta_contabil_id),
  constraint fk_cte_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_cte_2 foreign key (tomador_id) references pessoa (pessoa_id),
  constraint fk_cte_3 foreign key (remetente_id) references pessoa (pessoa_id),
  constraint fk_cte_4 foreign key (expedidor_id) references pessoa (pessoa_id),
  constraint fk_cte_5 foreign key (recebedor_id) references pessoa (pessoa_id),
  constraint fk_cte_6 foreign key (destinatario_emitente_id) references pessoa (pessoa_id),
  constraint fk_cte_7 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists cte_carga (
  cte_carga_id int(11) not null auto_increment,
  cte_id int(11) not null default '0',
  unidade_medida int(1) not null default '0',
  tipo_medida varchar(30) not null default '',
  quantidade decimal(15,4) not null default '0.0000',
  primary key (cte_carga_id),
  key k_cte_carga_1 (cte_id),
  constraint fk_cte_carga_1 foreign key (cte_id) references cte (cte_id)
) engine=innodb default charset=latin1;

create table if not exists cte_carga_unidade (
  cte_carga_unidade_id int(11) not null auto_increment,
  cte_documento_id int(11) not null default '0',
  cte_transporte_unidade_id int(11) default null,
  tipo_unidade_carga int(1) not null default '0',
  identificacao varchar(20) not null default '',
  quantidade_rateada decimal(8,4) not null default '0.0000',
  primary key (cte_carga_unidade_id),
  key k_cte_carga_unidade_1 (cte_documento_id),
  key k_cte_carga_unidade_2 (cte_transporte_unidade_id),
  constraint fk_cte_carga_unidade_1 foreign key (cte_documento_id) references cte_documento (cte_documento_id),
  constraint fk_cte_carga_unidade_2 foreign key (cte_transporte_unidade_id) references cte_transporte_unidade (cte_transporte_unidade_id)
) engine=innodb default charset=latin1;

create table if not exists cte_carga_unidade_lacre (
  cte_carga_unidade_lacre_id int(11) not null auto_increment,
  cte_carga_unidade_id int(11) not null default '0',
  numero varchar(20) not null default '',
  primary key (cte_carga_unidade_lacre_id),
  key k_cte_carga_unidade_lacre_1 (cte_carga_unidade_id),
  constraint fk_cte_carga_unidade_lacre_1 foreign key (cte_carga_unidade_id) references cte_carga_unidade (cte_carga_unidade_id)
) engine=innodb default charset=latin1;

create table if not exists cte_documento (
  cte_documento_id int(11) not null auto_increment,
  cte_id int(11) not null default '0',
  chave_acesso varchar(44) not null default '',
  pin_suframa varchar(9) not null default '',
  data_prevista_entrega date not null default '0001-01-01',
  romaneio varchar(20) not null default '',
  pedido varchar(20) not null default '',
  numero int(11) not null default '0',
  modelo int(2) not null default '0',
  serie int(3) not null default '0',
  data_emissao date not null default '0001-01-01',
  base_calculo_icms decimal(15,2) not null default '0.00',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  valor_icms_st decimal(15,2) not null default '0.00',
  valor_produtos decimal(15,2) not null default '0.00',
  valor_total decimal(15,2) not null default '0.00',
  cfop int(4) not null default '0',
  peso decimal(15,2) not null default '0.00',
  descricao varchar(10) not null default '',
  primary key (cte_documento_id),
  key k_cte_documento_1 (cte_id),
  constraint fk_cte_documento_1 foreign key (cte_id) references cte (cte_id)
) engine=innodb default charset=latin1;

create table if not exists cte_documento_transporte_anterior (
  cte_documento_transporte_anterior_id int(11) not null auto_increment,
  cte_id int(11) not null default '0',
  cnpj varchar(14) not null default '',
  inscricao_estadual varchar(20) not null default '',
  razao_social varchar(100) not null default '',
  uf char(2) not null default '',
  chave_acesso varchar(44) not null default '',
  primary key (cte_documento_transporte_anterior_id),
  key k_cte_documento_transporte_anterior_1 (cte_id),
  constraint fk_cte_documento_transporte_anterior_1 foreign key (cte_id) references cte (cte_id)
) engine=innodb default charset=latin1;

create table if not exists cte_duplicata (
  cte_duplicata_id int(11) not null auto_increment,
  cte_id int(11) not null default '0',
  numero varchar(60) not null default '',
  vencimento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  primary key (cte_duplicata_id),
  key k_cte_duplicata_1 (cte_id),
  constraint fk_cte_duplicata_1 foreign key (cte_id) references cte (cte_id)
) engine=innodb default charset=latin1;

create table if not exists cte_transporte_unidade (
  cte_transporte_unidade_id int(11) not null auto_increment,
  cte_documento_id int(11) not null default '0',
  tipo_unidade_transporte int(1) not null default '0',
  identificacao varchar(20) not null default '',
  quantidade_rateada decimal(5,2) not null default '0.00',
  primary key (cte_transporte_unidade_id),
  key k_cte_transporte_unidade_1 (cte_documento_id),
  constraint fk_cte_transporte_unidade_1 foreign key (cte_documento_id) references cte_documento (cte_documento_id)
) engine=innodb default charset=latin1;

create table if not exists cte_transporte_unidade_lacre (
  cte_transporte_unidade_lacre_id int(11) not null auto_increment,
  cte_transporte_unidade_id int(11) not null default '0',
  numero varchar(20) not null default '',
  primary key (cte_transporte_unidade_lacre_id),
  key k_cte_transporte_unidade_lacre_1 (cte_transporte_unidade_id),
  constraint fk_cte_transporte_unidade_lacre_1 foreign key (cte_transporte_unidade_id) references cte_transporte_unidade (cte_transporte_unidade_id)
) engine=innodb default charset=latin1;

create table if not exists departamento (
  departamento_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  nome varchar(50) not null default '',
  gerente_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (departamento_id),
  key k_departamento_1 (empresa_id),
  key k_departamento_2 (gerente_id),
  constraint fk_departamento_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_departamento_2 foreign key (gerente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists departamento_colaborador (
  departamento_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  principal tinyint(1) not null default '0',
  primary key (departamento_id,colaborador_id),
  key k_departamento_colaborador_1 (departamento_id),
  key k_departamento_colaborador_2 (colaborador_id),
  constraint fk_departamento_colaborador_1 foreign key (departamento_id) references departamento (departamento_id),
  constraint fk_departamento_colaborador_2 foreign key (colaborador_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists devolucao_compra (
  devolucao_compra_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  compra_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  operacao_id int(11) not null default '0',
  fornecedor_id int(11) not null default '0',
  transportador_id int(11) default null,
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  valor_impostos decimal(15,2) not null default '0.00',
  emissao_nfe int(1) not null default '0',
  estoque_id int(11) not null default '0',
  nfe_id int(11) default null,
  nf_id int(11) default null,
  status int(1) not null default '0',
  primary key (devolucao_compra_id),
  key k_devolucao_compra_1 (empresa_id),
  key k_devolucao_compra_2 (compra_id),
  key k_devolucao_compra_3 (operacao_id),
  key k_devolucao_compra_4 (fornecedor_id),
  key k_devolucao_compra_5 (transportador_id),
  key k_devolucao_compra_6 (estoque_id),
  key k_devolucao_compra_7 (nfe_id),
  key k_devolucao_compra_8 (nf_id),
  constraint fk_devolucao_compra_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_devolucao_compra_2 foreign key (compra_id) references compra (compra_id),
  constraint fk_devolucao_compra_3 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_devolucao_compra_4 foreign key (fornecedor_id) references pessoa (pessoa_id),
  constraint fk_devolucao_compra_5 foreign key (transportador_id) references pessoa (pessoa_id),
  constraint fk_devolucao_compra_6 foreign key (estoque_id) references estoque (estoque_id),
  constraint fk_devolucao_compra_7 foreign key (nfe_id) references nfe (nfe_id),
  constraint fk_devolucao_compra_8 foreign key (nf_id) references nf (nf_id)
) engine=innodb default charset=latin1;

create table if not exists devolucao_compra_item (
  devolucao_compra_item_id int(11) not null auto_increment,
  devolucao_compra_id int(11) not null default '0',
  compra_item_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  preco_custo_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  valor_impostos decimal(15,2) not null default '0.00',
  nfe_item_id int(11) default null,
  nf_item_id int(11) default null,
  primary key (devolucao_compra_item_id),
  key k_devolucao_compra_item_1 (devolucao_compra_id),
  key k_devolucao_compra_item_2 (compra_item_id),
  key k_devolucao_compra_item_3 (produto_id),
  key k_devolucao_compra_item_4 (produto_grade_id),
  key k_devolucao_compra_item_5 (produto_lote_id),
  key k_devolucao_compra_item_6 (nfe_item_id),
  key k_devolucao_compra_item_7 (nf_item_id),
  constraint fk_devolucao_compra_item_1 foreign key (devolucao_compra_id) references devolucao_compra (devolucao_compra_id),
  constraint fk_devolucao_compra_item_2 foreign key (compra_item_id) references compra_item (compra_item_id),
  constraint fk_devolucao_compra_item_3 foreign key (produto_id) references produto (produto_id),
  constraint fk_devolucao_compra_item_4 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_devolucao_compra_item_5 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_devolucao_compra_item_6 foreign key (nfe_item_id) references nfe_item (nfe_item_id),
  constraint fk_devolucao_compra_item_7 foreign key (nf_item_id) references nf_item (nf_item_id)
) engine=innodb default charset=latin1;

create table if not exists devolucao_venda (
  devolucao_venda_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  venda_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  operacao_id int(11) not null default '0',
  cliente_id int(11) default null,
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto_item decimal(15,2) not null default '0.00',
  valor_desconto_subtotal decimal(15,2) not null default '0.00',
  valor_acrescimo_item decimal(15,2) not null default '0.00',
  valor_acrescimo_subtotal decimal(15,2) not null default '0.00',
  usuario_id int(11) not null default '0',
  estoque_id int(11) not null default '0',
  nfe_id int(11) default null,
  status int(1) not null default '0',
  primary key (devolucao_venda_id),
  key k_devolucao_venda_1 (empresa_id),
  key k_devolucao_venda_2 (venda_id),
  key k_devolucao_venda_3 (operacao_id),
  key k_devolucao_venda_4 (cliente_id),
  key k_devolucao_venda_5 (usuario_id),
  key k_devolucao_venda_6 (estoque_id),
  key k_devolucao_venda_7 (nfe_id),
  constraint fk_devolucao_venda_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_devolucao_venda_2 foreign key (venda_id) references venda (venda_id),
  constraint fk_devolucao_venda_3 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_devolucao_venda_4 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_devolucao_venda_6 foreign key (estoque_id) references estoque (estoque_id),
  constraint fk_devolucao_venda_7 foreign key (nfe_id) references nfe (nfe_id)
) engine=innodb default charset=latin1;

create table if not exists devolucao_venda_item (
  devolucao_venda_item_id int(11) not null auto_increment,
  devolucao_venda_id int(11) not null default '0',
  venda_item_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  preco_custo_bruto decimal(15,4) not null default '0.0000',
  preco_venda_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto_item decimal(15,2) not null default '0.00',
  valor_desconto_subtotal decimal(15,2) not null default '0.00',
  valor_acrescimo_item decimal(15,2) not null default '0.00',
  valor_acrescimo_subtotal decimal(15,2) not null default '0.00',
  usuario_id int(11) not null default '0',
  nfe_item_id int(11) default null,
  primary key (devolucao_venda_item_id),
  key k_devolucao_venda_item_1 (devolucao_venda_id),
  key k_devolucao_venda_item_2 (venda_item_id),
  key k_devolucao_venda_item_3 (produto_id),
  key k_devolucao_venda_item_4 (produto_grade_id),
  key k_devolucao_venda_item_5 (produto_lote_id),
  key k_devolucao_venda_item_6 (usuario_id),
  key k_devolucao_venda_item_7 (nfe_item_id),
  constraint fk_devolucao_venda_item_1 foreign key (devolucao_venda_id) references devolucao_venda (devolucao_venda_id),
  constraint fk_devolucao_venda_item_2 foreign key (venda_item_id) references venda_item (venda_item_id),
  constraint fk_devolucao_venda_item_3 foreign key (produto_id) references produto (produto_id),
  constraint fk_devolucao_venda_item_4 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_devolucao_venda_item_5 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_devolucao_venda_item_7 foreign key (nfe_item_id) references nfe_item (nfe_item_id)
) engine=innodb default charset=latin1;

create table if not exists documento (
  documento_id int(11) not null auto_increment,
  nome varchar(100) not null default '',
  conteudo text not null,
  url_modelo varchar(500) not null default '',
  competencia tinyint(1) not null default '0',
  formato_competencia int(1) not null default '0',
  valido tinyint(1) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (documento_id),
  unique key uk_documento_1 (nome)
) engine=innodb default charset=latin1;

create table if not exists dominio (
  dominio_id int(11) not null auto_increment,
  nfe_id int(11) default null,
  nfce_id int(11) default null,
  nfse_id int(11) default null,
  envio varchar(50) not null default '',
  status int(1) not null default '0',
  job varchar(255) not null default '',
  primary key (dominio_id),
  unique key uk_dominio_1 (job),
  key k_dominio_1 (nfe_id),
  key k_dominio_2 (nfce_id),
  key k_dominio_3 (nfse_id),
  constraint fk_dominio_1 foreign key (nfe_id) references nfe (nfe_id),
  constraint fk_dominio_2 foreign key (nfce_id) references nfce (nfce_id),
  constraint fk_dominio_3 foreign key (nfse_id) references nfse (nfse_id)
) engine=innodb default charset=latin1;

create table if not exists empresa (
  empresa_id int(11) not null default '0',
  razao_social varchar(150) not null default '',
  nome_fantasia varchar(150) not null default '',
  cnpj varchar(14) not null default '',
  inscricao_estadual varchar(20) not null default '',
  inscricao_municipal varchar(20) not null default '',
  data_cadastro date not null default '0001-01-01',
  url_logo varchar(500) not null default '',
  enotas_empresa_id varchar(36) not null default '',
  enotas_atualizado tinyint(1) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (empresa_id),
  unique key uk_empresa_1 (cnpj)
) engine=innodb default charset=latin1;

create trigger bi_empresa before insert on empresa for each row
begin
    if new.razao_social = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.razao_social';
    end if;
    if new.cnpj = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.cnpj';
    end if;
    if new.data_cadastro < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.data_cadastro';
    end if;
    if new.enotas_atualizado not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.enotas_atualizado';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.excluido';
    end if;
end;

create trigger bu_empresa before update on empresa for each row
begin
    if new.razao_social = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.razao_social';
    end if;
    if new.cnpj = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.cnpj';
    end if;
    if new.data_cadastro < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.data_cadastro';
    end if;
    if new.enotas_atualizado not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.enotas_atualizado';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.excluido';
    end if;
end;

create table if not exists empresa_contato (
  empresa_contato_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  tipo int(1) not null default '0',
  contato varchar(50) not null default '',
  observacao text not null,
  primary key (empresa_contato_id),
  key k_empresa_contato_1 (empresa_id),
  constraint fk_empresa_contato_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create trigger bi_empresa_contato before insert on empresa_contato for each row
begin
    if new.tipo not in (1,2,3,4,5,6) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.tipo';
    end if;
    if new.contato = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.contato';
    end if;
end;

create trigger bu_empresa_contato before update on empresa_contato for each row
begin
    if new.tipo not in (1,2,3,4,5,6) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.tipo';
    end if;
    if new.contato = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.contato';
    end if;
end;

create table if not exists empresa_endereco (
  empresa_endereco_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  logradouro varchar(100) not null default '',
  numero varchar(10) not null default '',
  bairro varchar(50) not null default '',
  complemento varchar(50) not null default '',
  cep varchar(10) not null default '',
  cidade varchar(50) not null default '',
  uf char(2) not null default '',
  codigo_municipio varchar(7) not null default '',
  observacao text not null,
  principal tinyint(1) not null default '0',
  primary key (empresa_endereco_id),
  key k_empresa_endereco_1 (empresa_id),
  constraint fk_empresa_endereco_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create trigger bi_empresa_endereco before insert on empresa_endereco for each row
begin
    if new.logradouro = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.logradouro';
    end if;
    if new.codigo_municipio = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.codigo_municipio';
    end if;
    if new.principal not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.principal';
    end if;
end;

create trigger bu_empresa_endereco before update on empresa_endereco for each row
begin
    if new.logradouro = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.logradouro';
    end if;
    if new.codigo_municipio = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.codigo_municipio';
    end if;
    if new.principal not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.principal';
    end if;
end;

create table if not exists emprestimo (
  emprestimo_id int(11) not null auto_increment,
  conta_id int(11) not null default '0',
  fornecedor_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  valor_liquido decimal(15,2) not null default '0.00',
  valor_despesas decimal(15,2) not null default '0.00',
  valor_juros decimal(15,2) not null default '0.00',
  valor_total decimal(15,2) not null default '0.00',
  parcelas int(3) not null default '0',
  vencimento_dia int(2) not null default '0',
  vencimento_primeira_parcela datetime not null default '0001-01-01 00:00:00',
  cancelado tinyint(1) not null default '0',
  primary key (emprestimo_id),
  key k_emprestimo_1 (conta_id),
  key k_emprestimo_2 (fornecedor_id),
  constraint fk_emprestimo_1 foreign key (conta_id) references conta (conta_id),
  constraint fk_emprestimo_2 foreign key (fornecedor_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists emprestimo_categoria (
  emprestimo_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  tipo int(1) not null default '0',
  primary key (emprestimo_id,categoria_id),
  unique key uk_emprestimo_categoria_1 (emprestimo_id,tipo),
  key k_emprestimo_categoria_1 (emprestimo_id),
  key k_emprestimo_categoria_2 (categoria_id),
  constraint fk_emprestimo_categoria_1 foreign key (emprestimo_id) references emprestimo (emprestimo_id),
  constraint fk_emprestimo_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists equipe (
  equipe_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  nome varchar(50) not null default '',
  lider_id int(11) not null default '0',
  departamento_id int(11) default null,
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (equipe_id),
  key k_equipe_1 (empresa_id),
  key k_equipe_2 (lider_id),
  key k_equipe_3 (departamento_id),
  constraint fk_equipe_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_equipe_2 foreign key (lider_id) references pessoa (pessoa_id),
  constraint fk_equipe_3 foreign key (departamento_id) references departamento (departamento_id)
) engine=innodb default charset=latin1;

create table if not exists equipe_colaborador (
  equipe_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  principal tinyint(1) not null default '0',
  primary key (equipe_id,colaborador_id),
  key k_equipe_colaborador_1 (equipe_id),
  key k_equipe_colaborador_2 (colaborador_id),
  constraint fk_equipe_colaborador_1 foreign key (equipe_id) references equipe (equipe_id),
  constraint fk_equipe_colaborador_2 foreign key (colaborador_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists estoque (
  estoque_id int(11) not null auto_increment,
  nome varchar(100) not null default '',
  descricao varchar(500) not null default '',
  logradouro varchar(100) not null default '',
  numero varchar(10) not null default '',
  bairro varchar(50) not null default '',
  complemento varchar(50) not null default '',
  cep varchar(10) not null default '',
  cidade varchar(50) not null default '',
  uf char(2) not null default '',
  codigo_municipio varchar(7) not null default '',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists estoque_configuracao (
  estoque_id int(11) not null default '0',
  posicao int(2) not null default '0',
  nome varchar(20) not null default '',
  tamanho int(2) not null default '0',
  tipo int(1) not null default '0',
  primary key (estoque_id,posicao),
  key k_estoque_configuracao_1 (estoque_id),
  constraint fk_estoque_configuracao_1 foreign key (estoque_id) references estoque (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists estoque_empresa (
  estoque_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  principal tinyint(1) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (estoque_id,empresa_id),
  key k_estoque_empresa_1 (estoque_id),
  key k_estoque_empresa_2 (empresa_id),
  constraint fk_estoque_empresa_1 foreign key (estoque_id) references estoque (estoque_id),
  constraint fk_estoque_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists extrato (
  extrato_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data date not null default '0001-01-01',
  descricao varchar(100) not null default '',
  valor decimal(15,2) not null default '0.00',
  credito_debito char(1) not null default '',
  identificador varchar(50) not null default '',
  importacao_tipo int(1) not null default '0',
  importacao_data_hora datetime not null default '0001-01-01 00:00:00',
  processamento_data_hora datetime not null default '0001-01-01 00:00:00',
  processamento_usuario_id int(11) default null,
  status int(1) not null default '0',
  primary key (extrato_id),
  unique key uk_extrato_1 (empresa_id,identificador),
  key k_extrato_1 (empresa_id),
  key k_extrato_2 (processamento_usuario_id),
  constraint fk_extrato_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists extrato_movimento (
  extrato_id int(11) not null default '0',
  movimento_id int(11) not null default '0',
  primary key (extrato_id,movimento_id),
  key k_extrato_movimento_1 (extrato_id),
  key k_extrato_movimento_2 (movimento_id),
  constraint fk_extrato_movimento_1 foreign key (extrato_id) references extrato (extrato_id),
  constraint fk_extrato_movimento_2 foreign key (movimento_id) references movimento (movimento_id)
) engine=innodb default charset=latin1;

create table if not exists faturamento (
  faturamento_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  status int(1) not null default '0',
  primary key (faturamento_id),
  key k_faturamento_1 (empresa_id),
  constraint fk_faturamento_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists faturamento_contrato (
  faturamento_contrato_id int(11) not null auto_increment,
  faturamento_id int(11) not null default '0',
  cliente_contrato_id int(11) not null default '0',
  nfse_id int(11) default null,
  periodo_inicial date not null default '0001-01-01',
  periodo_final date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  primary key (faturamento_contrato_id),
  unique key uk_faturamento_contrato_1 (faturamento_id,cliente_contrato_id,periodo_inicial,periodo_final),
  key k_faturamento_contrato_1 (faturamento_id),
  key k_faturamento_contrato_2 (cliente_contrato_id),
  key k_faturamento_contrato_3 (nfse_id),
  constraint fk_faturamento_contrato_1 foreign key (faturamento_id) references faturamento (faturamento_id),
  constraint fk_faturamento_contrato_2 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id),
  constraint fk_faturamento_contrato_3 foreign key (nfse_id) references nfse (nfse_id)
) engine=innodb default charset=latin1;

create table if not exists faturamento_contrato_pagar (
  faturamento_contrato_id int(11) not null default '0',
  pagar_id int(11) not null default '0',
  primary key (faturamento_contrato_id,pagar_id),
  key k_faturamento_contrato_pagar_1 (faturamento_contrato_id),
  key k_faturamento_contrato_pagar_2 (pagar_id),
  constraint fk_faturamento_contrato_pagar_1 foreign key (faturamento_contrato_id) references faturamento_contrato (faturamento_contrato_id),
  constraint fk_faturamento_contrato_pagar_2 foreign key (pagar_id) references pagar (pagar_id)
) engine=innodb default charset=latin1;

create table if not exists faturamento_contrato_receber (
  faturamento_contrato_id int(11) not null default '0',
  receber_id int(11) not null default '0',
  primary key (faturamento_contrato_id,receber_id),
  key k_faturamento_contrato_receber_1 (faturamento_contrato_id),
  key k_faturamento_contrato_receber_2 (receber_id),
  constraint fk_faturamento_contrato_receber_1 foreign key (faturamento_contrato_id) references faturamento_contrato (faturamento_contrato_id),
  constraint fk_faturamento_contrato_receber_2 foreign key (receber_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists faturamento_parcial (
  faturamento_parcial_id int(11) not null auto_increment,
  cliente_contrato_id int(11) not null default '0',
  periodo_inicial date not null default '0001-01-01',
  periodo_final date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  primary key (faturamento_parcial_id),
  unique key uk_faturamento_parcial_1 (cliente_contrato_id,periodo_inicial,periodo_final),
  key k_faturamento_parcial_1 (cliente_contrato_id),
  constraint fk_faturamento_parcial_1 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists favorito (
  favorito_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  opcao_id int(11) not null default '0',
  acao_id int(11) not null default '0',
  primary key (favorito_id),
  key k_favorito_1 (empresa_id),
  key k_favorito_2 (usuario_id),
  constraint fk_favorito_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists feriado (
  feriado_id int(11) not null auto_increment,
  data date not null default '0001-01-01',
  descricao varchar(100) not null default '',
  tipo int(1) not null default '0',
  cidade varchar(50) not null default '',
  uf char(2) not null default '',
  primary key (feriado_id),
  key k_feriado_1 (data)
) engine=innodb default charset=latin1;

create table if not exists folha_pagamento (
  folha_pagamento_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  mes char(6) not null default '',
  tipo int(1) not null default '0',
  status int(1) not null default '0',
  primary key (folha_pagamento_id),
  unique key uk_folha_pagamento_1 (empresa_id,mes,tipo),
  key k_folha_pagamento_1 (empresa_id),
  constraint fk_folha_pagamento_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists folha_pagamento_evento (
  folha_pagamento_evento_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  nome varchar(100) not null default '',
  vencimento_desconto char(1) not null default '',
  categoria_id int(11) not null default '0',
  percentual_salario decimal(8,4) not null default '0.0000',
  primary key (folha_pagamento_evento_id),
  unique key uk_folha_pagamento_evento_1 (codigo_interno),
  key k_folha_pagamento_evento_1 (categoria_id),
  constraint fk_folha_pagamento_evento_1 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists folha_pagamento_evento_empresa (
  folha_pagamento_evento_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (folha_pagamento_evento_id,empresa_id),
  key k_folha_pagamento_evento_empresa_1 (folha_pagamento_evento_id),
  key k_folha_pagamento_evento_empresa_2 (empresa_id),
  constraint fk_folha_pagamento_evento_empresa_1 foreign key (folha_pagamento_evento_id) references folha_pagamento_evento (folha_pagamento_evento_id),
  constraint fk_folha_pagamento_evento_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists folha_pagamento_lancamento (
  folha_pagamento_lancamento_id int(11) not null auto_increment,
  folha_pagamento_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  folha_pagamento_evento_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  forma_pagamento_id int(11) not null default '0',
  centro_resultado_id int(11) default null,
  categoria_id int(11) not null default '0',
  descricao varchar(200) not null default '',
  data_lancamento date not null default '0001-01-01',
  data_vencimento date not null default '0001-01-01',
  data_pagamento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  vencimento_desconto char(1) not null default '',
  lancamento_vencimento_id int(11) default null,
  lancamento_automatico tinyint(1) not null default '0',
  pago tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (folha_pagamento_lancamento_id),
  key k_folha_pagamento_lancamento_1 (folha_pagamento_id),
  key k_folha_pagamento_lancamento_2 (colaborador_id),
  key k_folha_pagamento_lancamento_3 (folha_pagamento_evento_id),
  key k_folha_pagamento_lancamento_4 (conta_id),
  key k_folha_pagamento_lancamento_5 (forma_pagamento_id),
  key k_folha_pagamento_lancamento_6 (centro_resultado_id),
  key k_folha_pagamento_lancamento_7 (categoria_id),
  key k_folha_pagamento_lancamento_8 (lancamento_vencimento_id),
  constraint fk_folha_pagamento_lancamento_1 foreign key (folha_pagamento_id) references folha_pagamento (folha_pagamento_id),
  constraint fk_folha_pagamento_lancamento_2 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_folha_pagamento_lancamento_3 foreign key (folha_pagamento_evento_id) references folha_pagamento_evento (folha_pagamento_evento_id),
  constraint fk_folha_pagamento_lancamento_4 foreign key (conta_id) references conta (conta_id),
  constraint fk_folha_pagamento_lancamento_5 foreign key (forma_pagamento_id) references forma_pagamento (forma_pagamento_id),
  constraint fk_folha_pagamento_lancamento_6 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id),
  constraint fk_folha_pagamento_lancamento_7 foreign key (categoria_id) references categoria (categoria_id),
  constraint fk_folha_pagamento_lancamento_8 foreign key (lancamento_vencimento_id) references folha_pagamento_lancamento (folha_pagamento_lancamento_id)
) engine=innodb default charset=latin1;

create table if not exists forma_pagamento (
  forma_pagamento_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  nome varchar(50) not null default '',
  pagamento int(1) not null default '0',
  grupo_pagamento int(2) not null default '0',
  forma_pagamento_nfe int(2) not null default '0',
  abre_gaveta tinyint(1) not null default '0',
  tef tinyint(1) not null default '0',
  saldo tinyint(1) not null default '0',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (forma_pagamento_id),
  unique key uk_forma_pagamento_1 (codigo_interno)
) engine=innodb default charset=latin1;

create trigger bi_forma_pagamento before insert on forma_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.nome';
    end if;
    if new.pagamento not in (1,2,9) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.grupo_pagamento';
    end if;
    if new.abre_gaveta not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.abre_gaveta';
    end if;
    if new.tef not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.tef';
    end if;
    if new.saldo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.saldo';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.atualizado';
    end if;
end;

create trigger bu_forma_pagamento before update on forma_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.nome';
    end if;
    if new.pagamento not in (1,2,9) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.grupo_pagamento';
    end if;
    if new.abre_gaveta not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.abre_gaveta';
    end if;
    if new.tef not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.tef';
    end if;
    if new.saldo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.saldo';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.atualizado';
    end if;
end;

create table if not exists forma_pagamento_empresa (
  forma_pagamento_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (forma_pagamento_id,empresa_id),
  key k_forma_pagamento_empresa_1 (forma_pagamento_id),
  key k_forma_pagamento_empresa_2 (empresa_id),
  constraint fk_forma_pagamento_empresa_1 foreign key (forma_pagamento_id) references forma_pagamento (forma_pagamento_id),
  constraint fk_forma_pagamento_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists horario_especial (
  horario_especial_id int(11) not null auto_increment,
  data date not null default '0001-01-01',
  descricao varchar(100) not null default '',
  hora_inicial time not null default '00:00:00',
  hora_intervalo_inicial time not null default '00:00:00',
  hora_intervalo_final time not null default '00:00:00',
  hora_final time not null default '00:00:00',
  primary key (horario_especial_id),
  unique key uk_horario_especial_1 (data)
) engine=innodb default charset=latin1;

create table if not exists horario_especial_empresa (
  horario_especial_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  primary key (horario_especial_id,empresa_id),
  key k_horario_especial_empresa_1 (horario_especial_id),
  key k_horario_especial_empresa_2 (empresa_id),
  constraint fk_horario_especial_empresa_1 foreign key (horario_especial_id) references horario_especial (horario_especial_id),
  constraint fk_horario_especial_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists ibpt (
  ibpt_id int(11) not null auto_increment,
  codigo_ncm varchar(11) not null default '',
  uf char(2) not null default '',
  ex varchar(10) not null default '',
  tipo int(11) not null default '0',
  descricao varchar(1000) not null,
  nacional_federal decimal(15,2) not null default '0.00',
  importados_federal decimal(15,2) not null default '0.00',
  estadual decimal(15,2) not null default '0.00',
  municipal decimal(15,2) not null default '0.00',
  vigencia_inicio datetime not null default '0001-01-01 00:00:00',
  vigencia_fim datetime not null default '0001-01-01 00:00:00',
  chave varchar(25) not null default '',
  versao varchar(25) not null default '',
  fonte varchar(100) not null default '',
  primary key (ibpt_id)
) engine=innodb default charset=latin1;

create table if not exists ibpt_atualizacao (
  ibpt_arquivo_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  usuario_id int(11) not null default '0',
  primary key (ibpt_arquivo_id)
) engine=innodb default charset=latin1;

create table if not exists ideia (
  ideia_id int(11) not null auto_increment,
  usuario_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  descricao varchar(500) not null default '',
  visibilidade int(1) not null default '0',
  solicitacao_id int(11) default null,
  primary key (ideia_id),
  key k_ideia_1 (usuario_id),
  key k_ideia_2 (solicitacao_id),
  constraint fk_ideia_2 foreign key (solicitacao_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists ideia_voto (
  ideia_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  primary key (ideia_id,usuario_id),
  key k_ideia_voto_1 (ideia_id),
  key k_ideia_voto_2 (usuario_id),
  constraint fk_ideia_voto_1 foreign key (ideia_id) references ideia (ideia_id)
) engine=innodb default charset=latin1;

create table if not exists igpm (
  mes char(6) not null default '',
  indice decimal(8,4) not null default '0.0000',
  primary key (mes)
) engine=innodb default charset=latin1;

create trigger bi_igpm before insert on igpm for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: igpm.mes';
    end if;
end;

create trigger bu_igpm before update on igpm for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: igpm.mes';
    end if;
end;

create table if not exists importacao (
  importacao_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  tipo int(2) not null default '0',
  status int(2) not null default '0',
  job varchar(255) not null default '',
  url_arquivo varchar(500) not null default '',
  url_relatorio varchar(500) not null default '',
  primary key (importacao_id),
  key k_importacao_1 (empresa_id),
  key k_importacao_2 (usuario_id),
  constraint fk_importacao_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists integracao_bancaria (
  integracao_bancaria_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  instituicao_financeira_id int(11) not null default '0',
  conta_id int(11) default null,
  data_hora datetime not null default '0001-01-01 00:00:00',
  valor decimal(15,2) not null default '0.00',
  tipo_arquivo int(1) not null default '0',
  url_arquivo varchar(500) not null default '',
  status int(1) not null default '0',
  primary key (integracao_bancaria_id),
  key k_integracao_bancaria_1 (empresa_id),
  key k_integracao_bancaria_2 (conta_id),
  constraint fk_integracao_bancaria_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_integracao_bancaria_2 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists integracao_bancaria_boleto (
  integracao_bancaria_boleto_id int(11) not null auto_increment,
  integracao_bancaria_id int(11) not null default '0',
  receber_boleto_id int(11) default null,
  nosso_numero varchar(20) not null default '',
  documento varchar(20) not null default '',
  emissao date not null default '0001-01-01',
  vencimento date not null default '0001-01-01',
  pagamento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  ocorrencia char(2) not null default '',
  instituicao_financeira_id int(11) not null default '0',
  numero_agencia varchar(20) not null default '',
  cpf_cnpj_sacado varchar(20) not null default '',
  nome_sacado varchar(100) not null default '',
  observacao varchar(100) not null default '',
  primary key (integracao_bancaria_boleto_id),
  key k_integracao_bancaria_boleto_1 (integracao_bancaria_id),
  key k_integracao_bancaria_boleto_2 (receber_boleto_id),
  constraint fk_integracao_bancaria_boleto_1 foreign key (integracao_bancaria_id) references integracao_bancaria (integracao_bancaria_id),
  constraint fk_integracao_bancaria_boleto_2 foreign key (receber_boleto_id) references receber_boleto (receber_boleto_id)
) engine=innodb default charset=latin1;

create table if not exists ipca (
  mes char(6) not null default '',
  indice decimal(8,4) not null default '0.0000',
  primary key (mes)
) engine=innodb default charset=latin1;

create trigger bi_ipca before insert on ipca for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: ipca.mes';
    end if;
end;

create trigger bu_ipca before update on ipca for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: ipca.mes';
    end if;
end;

create table if not exists log (
  log_id int(11) not null auto_increment,
  usuario_id int(11) default null,
  data_hora datetime not null default '0001-01-01 00:00:00',
  acao int(2) not null default '0',
  objeto int(3) not null default '0',
  objeto_id int(11) not null default '0',
  objeto_dados text not null,
  objeto_referente int(3) not null default '0',
  objeto_referente_id int(11) not null default '0',
  objeto_referente_dados text not null,
  primary key (log_id),
  key k_log_1 (usuario_id),
  key k_log_2 (data_hora),
  key k_log_3 (objeto,objeto_id),
  key k_log_4 (objeto_referente,objeto_referente_id)
) engine=innodb default charset=latin1;

create table if not exists log_empresa (
  log_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  primary key (log_id,empresa_id),
  key k_log_empresa_1 (log_id),
  key k_log_empresa_2 (empresa_id),
  constraint fk_log_empresa_1 foreign key (log_id) references log (log_id),
  constraint fk_log_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists movimento (
  movimento_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  caixa_id int(11) default null,
  descricao varchar(200) not null default '',
  data_hora_lancamento datetime not null default '0001-01-01 00:00:00',
  data_hora_movimento datetime not null default '0001-01-01 00:00:00',
  compra_id int(11) default null,
  venda_id int(11) default null,
  pagamento_id int(11) default null,
  recebimento_id int(11) default null,
  folha_pagamento_lancamento_id int(11) default null,
  transferencia_id int(11) default null,
  pagar_id int(11) default null,
  receber_id int(11) default null,
  devolucao_compra_id int(11) default null,
  devolucao_venda_id int(11) default null,
  emprestimo_id int(11) default null,
  valor decimal(15,2) not null default '0.00',
  credito_debito char(1) not null default '',
  pendente tinyint(1) not null default '0',
  cancelado tinyint(1) not null default '0',
  primary key (movimento_id),
  key k_movimento_1 (empresa_id),
  key k_movimento_2 (conta_id),
  key k_movimento_3 (caixa_id),
  key k_movimento_4 (compra_id),
  key k_movimento_5 (venda_id),
  key k_movimento_6 (pagamento_id),
  key k_movimento_7 (recebimento_id),
  key k_movimento_8 (folha_pagamento_lancamento_id),
  key k_movimento_9 (transferencia_id),
  key k_movimento_10 (pagar_id),
  key k_movimento_11 (receber_id),
  key k_movimento_12 (devolucao_compra_id),
  key k_movimento_13 (devolucao_venda_id),
  key k_movimento_14 (emprestimo_id),
  constraint fk_movimento_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_movimento_10 foreign key (pagar_id) references pagar (pagar_id),
  constraint fk_movimento_11 foreign key (receber_id) references receber (receber_id),
  constraint fk_movimento_12 foreign key (devolucao_compra_id) references devolucao_compra (devolucao_compra_id),
  constraint fk_movimento_13 foreign key (devolucao_venda_id) references devolucao_venda (devolucao_venda_id),
  constraint fk_movimento_14 foreign key (emprestimo_id) references emprestimo (emprestimo_id),
  constraint fk_movimento_2 foreign key (conta_id) references conta (conta_id),
  constraint fk_movimento_3 foreign key (caixa_id) references caixa (caixa_id),
  constraint fk_movimento_4 foreign key (compra_id) references compra (compra_id),
  constraint fk_movimento_5 foreign key (venda_id) references venda (venda_id),
  constraint fk_movimento_6 foreign key (pagamento_id) references pagamento (pagamento_id),
  constraint fk_movimento_7 foreign key (recebimento_id) references recebimento (recebimento_id),
  constraint fk_movimento_8 foreign key (folha_pagamento_lancamento_id) references folha_pagamento_lancamento (folha_pagamento_lancamento_id),
  constraint fk_movimento_9 foreign key (transferencia_id) references movimento (movimento_id)
) engine=innodb default charset=latin1;

create table if not exists movimento_anexo (
  movimento_anexo_id int(11) not null auto_increment,
  movimento_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  primary key (movimento_anexo_id),
  key k_movimento_anexo_1 (movimento_id),
  constraint fk_movimento_anexo_1 foreign key (movimento_id) references movimento (movimento_id)
) engine=innodb default charset=latin1;

create table if not exists movimento_categoria (
  movimento_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  conta_cartao_id int(11) default null,
  credito_debito_conta_cartao char(1) not null default '',
  valor decimal(15,2) not null default '0.00',
  primary key (movimento_id,categoria_id),
  key k_movimento_categoria_1 (movimento_id),
  key k_movimento_categoria_2 (categoria_id),
  key k_movimento_categoria_3 (conta_cartao_id),
  constraint fk_movimento_categoria_1 foreign key (movimento_id) references movimento (movimento_id),
  constraint fk_movimento_categoria_2 foreign key (categoria_id) references categoria (categoria_id),
  constraint fk_movimento_categoria_3 foreign key (conta_cartao_id) references conta_cartao (conta_cartao_id)
) engine=innodb default charset=latin1;

create table if not exists movimento_centro_resultado (
  movimento_id int(11) not null default '0',
  centro_resultado_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  primary key (movimento_id,centro_resultado_id),
  key k_movimento_centro_resultado_1 (movimento_id),
  key k_movimento_centro_resultado_2 (centro_resultado_id),
  constraint fk_movimento_centro_resultado_1 foreign key (movimento_id) references movimento (movimento_id),
  constraint fk_movimento_centro_resultado_2 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id)
) engine=innodb default charset=latin1;

create table if not exists movimento_conta_contabil (
  movimento_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  conta_contabil_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  saldo int(1) not null default '0',
  regime int(1) not null default '0',
  primary key (movimento_id,categoria_id,conta_contabil_id,regime),
  key k_movimento_conta_contabil_1 (movimento_id),
  key k_movimento_conta_contabil_2 (categoria_id),
  key k_movimento_conta_contabil_3 (conta_contabil_id),
  key k_movimento_conta_contabil_4 (movimento_id,categoria_id),
  constraint fk_movimento_conta_contabil_1 foreign key (movimento_id) references movimento (movimento_id),
  constraint fk_movimento_conta_contabil_2 foreign key (categoria_id) references categoria (categoria_id),
  constraint fk_movimento_conta_contabil_3 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id),
  constraint fk_movimento_conta_contabil_4 foreign key (movimento_id, categoria_id) references movimento_categoria (movimento_id, categoria_id)
) engine=innodb default charset=latin1;

create table if not exists movimento_forma_pagamento (
  movimento_forma_pagamento_id int(11) not null auto_increment,
  movimento_id int(11) not null default '0',
  forma_pagamento_id int(11) not null default '0',
  cheque_id int(11) default null,
  cartao_id int(11) default null,
  pix_id int(11) default null,
  valor decimal(15,2) not null default '0.00',
  credito_debito char(1) not null default '',
  saldo tinyint(1) not null default '0',
  primary key (movimento_forma_pagamento_id),
  key k_movimento_forma_pagamento_1 (movimento_id),
  key k_movimento_forma_pagamento_2 (forma_pagamento_id),
  key k_movimento_forma_pagamento_3 (cheque_id),
  key k_movimento_forma_pagamento_4 (cartao_id),
  key k_movimento_forma_pagamento_5 (pix_id),
  constraint fk_movimento_forma_pagamento_1 foreign key (movimento_id) references movimento (movimento_id),
  constraint fk_movimento_forma_pagamento_2 foreign key (forma_pagamento_id) references forma_pagamento (forma_pagamento_id),
  constraint fk_movimento_forma_pagamento_3 foreign key (cheque_id) references cheque (cheque_id),
  constraint fk_movimento_forma_pagamento_4 foreign key (cartao_id) references cartao (cartao_id),
  constraint fk_movimento_forma_pagamento_5 foreign key (pix_id) references pix (pix_id)
) engine=innodb default charset=latin1;

create table if not exists movimento_operacao (
  movimento_id int(11) not null default '0',
  movimentou_estoque tinyint(1) not null default '0',
  movimentou_financeiro tinyint(1) not null default '0',
  atualizou_precos tinyint(1) not null default '0',
  primary key (movimento_id),
  constraint fk_movimento_operacao_1 foreign key (movimento_id) references movimento (movimento_id)
) engine=innodb default charset=latin1;

create table if not exists nf (
  nf_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  numero int(11) not null default '0',
  operacao_id int(11) not null default '0',
  data_hora_emissao datetime not null default '0001-01-01 00:00:00',
  data_hora_entrada datetime not null default '0001-01-01 00:00:00',
  serie int(3) not null default '0',
  emitente_id int(11) not null default '0',
  tipo_frete int(2) not null default '0',
  transportador_id int(11) default null,
  pagamento int(1) not null default '0',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  base_calculo_icms decimal(15,2) not null default '0.00',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  valor_icms_st decimal(15,2) not null default '0.00',
  base_calculo_ipi decimal(15,2) not null default '0.00',
  valor_ipi decimal(15,2) not null default '0.00',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st decimal(15,2) not null default '0.00',
  valor_fcp_icms_st decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  estoque_id int(11) not null default '0',
  observacao text not null,
  cancelada tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (nf_id),
  key k_nf_1 (empresa_id),
  key k_nf_2 (operacao_id),
  key k_nf_3 (emitente_id),
  key k_nf_4 (transportador_id),
  key k_nf_5 (estoque_id),
  constraint fk_nf_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_nf_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_nf_3 foreign key (emitente_id) references pessoa (pessoa_id),
  constraint fk_nf_4 foreign key (transportador_id) references pessoa (pessoa_id),
  constraint fk_nf_5 foreign key (estoque_id) references estoque (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists nf_item (
  nf_item_id int(11) not null auto_increment,
  nf_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  cfop int(4) not null default '0',
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  valor_unitario_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  cst_icms char(3) not null default '',
  base_calculo_icms decimal(15,2) not null default '0.00',
  aliquota_icms decimal(8,4) not null default '0.0000',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  aliquota_icms_st decimal(8,4) not null default '0.0000',
  aliquota_icms_st_interestadual decimal(8,4) not null default '0.0000',
  valor_icms_st decimal(15,2) not null default '0.00',
  cst_ipi char(3) not null default '',
  base_calculo_ipi decimal(15,2) not null default '0.00',
  aliquota_ipi decimal(8,4) not null default '0.0000',
  valor_ipi decimal(15,2) not null default '0.00',
  cst_pis_cofins char(3) not null default '',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st_retido decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  percentual_fcp_icms decimal(8,4) not null default '0.0000',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  codigo_credito_pis_cofins int(3) not null default '0',
  natureza_bc_c_pis_cofins int(3) not null default '0',
  conta_contabil_id int(11) default null,
  excluido tinyint(1) not null default '0',
  primary key (nf_item_id),
  key k_nf_item_1 (nf_id),
  key k_nf_item_2 (produto_id),
  key k_nf_item_3 (produto_grade_id),
  key k_nf_item_4 (produto_lote_id),
  key k_nf_item_5 (conta_contabil_id),
  constraint fk_nf_item_1 foreign key (nf_id) references nf (nf_id),
  constraint fk_nf_item_2 foreign key (produto_id) references produto (produto_id),
  constraint fk_nf_item_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_nf_item_4 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_nf_item_5 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists nfce (
  nfce_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  cliente_id int(11) default null,
  numero int(11) not null default '0',
  serie int(3) not null default '0',
  chave_acesso varchar(44) not null default '',
  protocolo varchar(15) not null default '',
  recibo varchar(15) not null default '',
  data_hora_emissao datetime not null default '0001-01-01 00:00:00',
  data_hora_saida datetime not null default '0001-01-01 00:00:00',
  pagamento int(1) not null default '0',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  base_calculo_icms decimal(15,2) not null default '0.00',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  valor_icms_st decimal(15,2) not null default '0.00',
  base_calculo_iss decimal(15,2) not null default '0.00',
  valor_iss decimal(15,2) not null default '0.00',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  tipo_emissao int(2) not null default '0',
  url_xml varchar(500) not null default '',
  url_xml_cancelamento varchar(500) not null default '',
  data_hora_cancelamento datetime not null default '0001-01-01 00:00:00',
  justificativa_cancelamento text not null,
  estoque_id int(11) not null default '0',
  observacao text not null,
  observacao_fisco text not null,
  job varchar(255) not null default '',
  emitida tinyint(1) not null default '0',
  cancelada tinyint(1) not null default '0',
  substituida tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (nfce_id),
  key k_nfce_1 (empresa_id),
  key k_nfce_2 (cliente_id),
  key k_nfce_3 (estoque_id),
  constraint fk_nfce_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_nfce_2 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_nfce_3 foreign key (estoque_id) references estoque (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists nfce_contingencia (
  nfce_contingencia_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data_hora_entrada datetime not null default '0001-01-01 00:00:00',
  data_hora_saida datetime not null default '0001-01-01 00:00:00',
  justificativa text not null,
  ativo tinyint(1) not null default '0',
  primary key (nfce_contingencia_id),
  key k_nfce_contingencia_1 (empresa_id),
  constraint fk_nfce_contingencia_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists nfce_item (
  nfce_item_id int(11) not null auto_increment,
  nfce_id int(11) not null default '0',
  numero_item int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  cfop int(4) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  preco_venda_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  cst_icms char(3) not null default '',
  base_calculo_icms decimal(15,2) not null default '0.00',
  aliquota_icms decimal(8,4) not null default '0.0000',
  valor_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  aliquota_icms_st decimal(8,4) not null default '0.0000',
  valor_icms_st decimal(15,2) not null default '0.00',
  base_calculo_iss decimal(15,2) not null default '0.00',
  aliquota_iss decimal(8,4) not null default '0.0000',
  valor_iss decimal(15,2) not null default '0.00',
  cst_pis_cofins char(3) not null default '',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st_retido decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  percentual_fcp_icms decimal(8,4) not null default '0.0000',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  codigo_contribuicao_pis_cofins int(3) not null default '0',
  natureza_receita_pis_cofins char(3) not null default '',
  conta_contabil_id int(11) default null,
  primary key (nfce_item_id),
  key k_nfce_item_1 (nfce_id),
  key k_nfce_item_2 (produto_id),
  key k_nfce_item_3 (produto_grade_id),
  key k_nfce_item_4 (produto_lote_id),
  key k_nfce_item_5 (conta_contabil_id),
  constraint fk_nfce_item_1 foreign key (nfce_id) references nfce (nfce_id),
  constraint fk_nfce_item_2 foreign key (produto_id) references produto (produto_id),
  constraint fk_nfce_item_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_nfce_item_4 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_nfce_item_5 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists nfce_numeracao_inutilizada (
  nfce_numeracao_inutilizada_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data date not null default '0001-01-01',
  serie int(3) not null default '0',
  numero_inicial int(11) not null default '0',
  numero_final int(11) not null default '0',
  justificativa text not null,
  url_xml varchar(500) not null default '0',
  primary key (nfce_numeracao_inutilizada_id),
  key k_nfce_numeracao_inutilizada_1 (empresa_id),
  constraint fk_nfce_numeracao_inutilizada_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists nfce_substituta (
  nfce_id int(11) not null default '0',
  numero int(11) not null default '0',
  serie int(3) not null default '0',
  primary key (nfce_id),
  key k_nfce_substituta_1 (nfce_id),
  constraint fk_nfce_substituta_1 foreign key (nfce_id) references nfce (nfce_id)
) engine=innodb default charset=latin1;

create table if not exists nfe (
  nfe_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  numero int(11) not null default '0',
  entrada_saida char(1) not null default '',
  finalidade int(1) not null default '0',
  chave_acesso varchar(44) not null default '',
  protocolo varchar(15) not null default '',
  recibo varchar(15) not null default '',
  consumidor_final tinyint(1) not null default '0',
  presenca int(2) not null default '0',
  operacao_id int(11) not null default '0',
  data_hora_emissao datetime not null default '0001-01-01 00:00:00',
  data_hora_entrada_saida datetime not null default '0001-01-01 00:00:00',
  serie int(3) not null default '0',
  emitente int(1) not null default '0',
  destinatario_emitente_id int(11) not null default '0',
  tipo_frete int(2) not null default '0',
  transportador_id int(11) default null,
  pagamento int(1) not null default '0',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  base_calculo_icms decimal(15,2) not null default '0.00',
  valor_icms decimal(15,2) not null default '0.00',
  valor_diferimento_icms decimal(15,2) not null default '0.00',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  valor_icms_st decimal(15,2) not null default '0.00',
  base_calculo_ipi decimal(15,2) not null default '0.00',
  valor_ipi decimal(15,2) not null default '0.00',
  base_calculo_iss decimal(15,2) not null default '0.00',
  valor_iss decimal(15,2) not null default '0.00',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  base_calculo_icms_st_retido decimal(15,2) not null default '0.00',
  valor_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_icms_retido decimal(15,2) not null default '0.00',
  valor_icms_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st decimal(15,2) not null default '0.00',
  valor_fcp_icms_st decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  url_xml varchar(500) not null default '',
  url_xml_cancelamento varchar(500) not null default '',
  estoque_id int(11) default null,
  observacao text not null,
  observacao_fisco text not null,
  emitida tinyint(1) not null default '0',
  cancelada tinyint(1) not null default '0',
  denegada tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (nfe_id),
  key k_nfe_1 (empresa_id),
  key k_nfe_2 (operacao_id),
  key k_nfe_3 (destinatario_emitente_id),
  key k_nfe_4 (transportador_id),
  key k_nfe_5 (estoque_id),
  constraint fk_nfe_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_nfe_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_nfe_3 foreign key (destinatario_emitente_id) references pessoa (pessoa_id),
  constraint fk_nfe_4 foreign key (transportador_id) references pessoa (pessoa_id),
  constraint fk_nfe_5 foreign key (estoque_id) references estoque (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_ajuste_item (
  nfe_ajuste_item_id int(11) not null auto_increment,
  nfe_id int(11) not null default '0',
  cfop int(4) not null default '0',
  numero_item int(11) not null default '0',
  codigo varchar(10) not null default '',
  descricao varchar(100) not null default '',
  valor decimal(15,2) not null default '0.00',
  primary key (nfe_ajuste_item_id),
  key k_nfe_ajuste_item_1 (nfe_id),
  constraint fk_nfe_ajuste_item_1 foreign key (nfe_id) references nfe (nfe_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_cce (
  nfe_cce_id int(11) not null auto_increment,
  nfe_id int(11) not null default '0',
  data date not null default '0001-01-01',
  sequencia int(11) not null default '0',
  correcao text not null,
  url_xml varchar(500) not null default '0',
  primary key (nfe_cce_id),
  key k_nfe_cce_1 (nfe_id),
  constraint fk_nfe_cce_1 foreign key (nfe_id) references nfe (nfe_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_contingencia (
  nfe_contingencia_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data_hora_entrada datetime not null default '0001-01-01 00:00:00',
  data_hora_saida datetime not null default '0001-01-01 00:00:00',
  justificativa text not null,
  ativo tinyint(1) not null default '0',
  primary key (nfe_contingencia_id),
  key k_nfe_contingencia_1 (empresa_id),
  constraint fk_nfe_contingencia_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_item (
  nfe_item_id int(11) not null auto_increment,
  nfe_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  cfop int(4) not null default '0',
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  valor_unitario_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_frete decimal(15,2) not null default '0.00',
  valor_seguro decimal(15,2) not null default '0.00',
  valor_outras_despesas decimal(15,2) not null default '0.00',
  cst_icms char(3) not null default '',
  modalidade_bc_icms int(1) not null default '0',
  percentual_bc_icms decimal(8,4) not null default '0.0000',
  base_calculo_icms decimal(15,2) not null default '0.00',
  aliquota_icms decimal(8,4) not null default '0.0000',
  valor_icms decimal(15,2) not null default '0.00',
  percentual_diferimento_icms decimal(8,4) not null default '0.0000',
  valor_diferimento_icms decimal(15,2) not null default '0.00',
  modalidade_bc_icms_st int(1) not null default '0',
  percentual_bc_icms_st decimal(8,4) not null default '0.0000',
  base_calculo_icms_st decimal(15,2) not null default '0.00',
  aliquota_icms_st decimal(8,4) not null default '0.0000',
  aliquota_icms_st_interestadual decimal(8,4) not null default '0.0000',
  valor_icms_st decimal(15,2) not null default '0.00',
  mva_icms_st decimal(8,4) not null default '0.0000',
  cst_ipi char(3) not null default '',
  base_calculo_ipi decimal(15,2) not null default '0.00',
  aliquota_ipi decimal(8,4) not null default '0.0000',
  valor_ipi decimal(15,2) not null default '0.00',
  base_calculo_iss decimal(15,2) not null default '0.00',
  aliquota_iss decimal(8,4) not null default '0.0000',
  valor_iss decimal(15,2) not null default '0.00',
  cst_pis_cofins char(3) not null default '',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  quantidade_emissao_nfe decimal(15,4) not null default '0.0000',
  base_calculo_icms_st_retido decimal(15,2) not null default '0.00',
  aliquota_icms_st_retido decimal(8,4) not null default '0.0000',
  valor_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_icms_retido decimal(15,2) not null default '0.00',
  aliquota_icms_retido decimal(8,4) not null default '0.0000',
  valor_icms_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st_retido decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st_retido decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms_st decimal(15,2) not null default '0.00',
  percentual_fcp_icms_st decimal(8,4) not null default '0.0000',
  valor_fcp_icms_st decimal(15,2) not null default '0.00',
  base_calculo_fcp_icms decimal(15,2) not null default '0.00',
  percentual_fcp_icms decimal(8,4) not null default '0.0000',
  valor_fcp_icms decimal(15,2) not null default '0.00',
  codigo_credito_pis_cofins int(3) not null default '0',
  natureza_bc_c_pis_cofins int(3) not null default '0',
  codigo_contribuicao_pis_cofins int(3) not null default '0',
  natureza_receita_pis_cofins char(3) not null default '',
  conta_contabil_id int(11) default null,
  excluido tinyint(1) not null default '0',
  primary key (nfe_item_id),
  key k_nfe_item_1 (nfe_id),
  key k_nfe_item_2 (produto_id),
  key k_nfe_item_3 (produto_grade_id),
  key k_nfe_item_4 (produto_lote_id),
  key k_nfe_item_5 (conta_contabil_id),
  constraint fk_nfe_item_1 foreign key (nfe_id) references nfe (nfe_id),
  constraint fk_nfe_item_2 foreign key (produto_id) references produto (produto_id),
  constraint fk_nfe_item_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_nfe_item_4 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_nfe_item_5 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_item_icms_st_retido (
  nfe_item_icms_st_retido_id int(11) not null auto_increment,
  nfe_item_id int(11) not null default '0',
  saida_nfe_item_id int(11) default null,
  saida_nfce_item_id int(11) default null,
  saida_cfe_sat_item_id int(11) default null,
  saida_cfe_mfe_item_id int(11) default null,
  saida_quantidade decimal(15,4) not null default '0.0000',
  primary key (nfe_item_icms_st_retido_id),
  unique key uk_nfe_item_icms_st_retido_1 (nfe_item_id,saida_nfe_item_id,saida_nfce_item_id,saida_cfe_sat_item_id,saida_cfe_mfe_item_id),
  key k_nfe_item_icms_st_retido_1 (nfe_item_id),
  key k_nfe_item_icms_st_retido_2 (saida_nfe_item_id),
  key k_nfe_item_icms_st_retido_3 (saida_nfce_item_id),
  key k_nfe_item_icms_st_retido_4 (saida_cfe_sat_item_id),
  key k_nfe_item_icms_st_retido_5 (saida_cfe_mfe_item_id),
  constraint fk_nfe_item_icms_st_retido_1 foreign key (nfe_item_id) references nfe_item (nfe_item_id),
  constraint fk_nfe_item_icms_st_retido_2 foreign key (saida_nfe_item_id) references nfe_item (nfe_item_id),
  constraint fk_nfe_item_icms_st_retido_3 foreign key (saida_nfce_item_id) references nfce_item (nfce_item_id),
  constraint fk_nfe_item_icms_st_retido_4 foreign key (saida_cfe_sat_item_id) references cfe_sat_item (cfe_sat_item_id),
  constraint fk_nfe_item_icms_st_retido_5 foreign key (saida_cfe_mfe_item_id) references cfe_mfe_item (cfe_mfe_item_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_numeracao_inutilizada (
  nfe_numeracao_inutilizada_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data date not null default '0001-01-01',
  serie int(3) not null default '0',
  numero_inicial int(11) not null default '0',
  numero_final int(11) not null default '0',
  justificativa text not null,
  url_xml varchar(500) not null default '0',
  primary key (nfe_numeracao_inutilizada_id),
  key k_nfe_numeracao_inutilizada_1 (empresa_id),
  constraint fk_nfe_numeracao_inutilizada_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_referenciada (
  nfe_id int(11) not null default '0',
  chave_acesso_nfe_referenciada varchar(44) not null default '',
  primary key (nfe_id,chave_acesso_nfe_referenciada),
  key k_nfe_referenciada_1 (nfe_id),
  constraint fk_nfe_referenciada_1 foreign key (nfe_id) references nfe (nfe_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_volume (
  nfe_volume_id int(11) not null auto_increment,
  nfe_id int(11) not null default '0',
  quantidade int(11) not null default '0',
  especie varchar(60) not null default '',
  marca varchar(60) not null default '',
  numeracao varchar(60) not null default '',
  peso_liquido decimal(15,4) not null default '0.0000',
  peso_bruto decimal(15,4) not null default '0.0000',
  primary key (nfe_volume_id),
  key k_nfe_volume_1 (nfe_id),
  constraint fk_nfe_volume_1 foreign key (nfe_id) references nfe (nfe_id)
) engine=innodb default charset=latin1;

create table if not exists nfe_volume_lacre (
  nfe_volume_lacre_id int(11) not null auto_increment,
  nfe_volume_id int(11) not null default '0',
  numero varchar(60) not null default '0',
  primary key (nfe_volume_lacre_id),
  key k_nfe_volume_lacre_1 (nfe_volume_id),
  constraint fk_nfe_volume_lacre_1 foreign key (nfe_volume_id) references nfe_volume (nfe_volume_id)
) engine=innodb default charset=latin1;

create table if not exists nfse (
  nfse_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  numero bigint(20) not null default '0',
  numero_rps int(11) not null default '0',
  tipo int(1) not null default '0',
  chave_acesso varchar(44) not null default '',
  operacao_id int(11) not null default '0',
  data_emissao date not null default '0001-01-01',
  data_competencia date not null default '0001-01-01',
  serie int(3) not null default '0',
  cliente_id int(11) default null,
  pagamento int(1) not null default '0',
  valor_total decimal(15,2) not null default '0.00',
  valor_servicos decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  base_calculo_iss decimal(15,2) not null default '0.00',
  valor_iss decimal(15,2) not null default '0.00',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  url_pdf varchar(500) not null default '',
  url_xml varchar(500) not null default '',
  url_xml_cancelamento varchar(500) not null default '',
  tecnospeed_handle int(11) not null default '0',
  tecnospeed_erro varchar(500) not null default '',
  enotas_nfse_id varchar(36) not null default '',
  observacao text not null,
  status int(2) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (nfse_id),
  key k_nfse_1 (empresa_id),
  key k_nfse_2 (operacao_id),
  key k_nfse_3 (cliente_id),
  constraint fk_nfse_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_nfse_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_nfse_3 foreign key (cliente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists nfse_item (
  nfse_item_id int(11) not null auto_increment,
  nfse_id int(11) not null default '0',
  servico_id int(11) not null default '0',
  descricao text not null,
  numero_item int(11) not null default '0',
  valor_total decimal(15,2) not null default '0.00',
  valor_servico decimal(15,4) not null default '0.0000',
  valor_desconto decimal(15,2) not null default '0.00',
  base_calculo_iss decimal(15,2) not null default '0.00',
  aliquota_iss decimal(8,4) not null default '0.0000',
  valor_iss decimal(15,2) not null default '0.00',
  tipo_tributacao_servico int(1) not null default '0',
  natureza_tributacao_servico int(1) not null default '0',
  iss_retido tinyint(1) not null default '0',
  exigibilidade_iss int(1) not null default '0',
  operacao_servico int(1) not null default '0',
  codigo_cnae varchar(10) not null default '',
  cst_pis_cofins char(3) not null default '',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  codigo_contribuicao_pis_cofins int(3) not null default '0',
  natureza_receita_pis_cofins char(3) not null default '',
  codigo_tributacao_municipio varchar(20) not null default '',
  conta_contabil_id int(11) default null,
  excluido tinyint(1) not null default '0',
  primary key (nfse_item_id),
  key k_nfse_item_1 (nfse_id),
  key k_nfse_item_2 (servico_id),
  key k_nfse_item_3 (conta_contabil_id),
  constraint fk_nfse_item_1 foreign key (nfse_id) references nfse (nfse_id),
  constraint fk_nfse_item_2 foreign key (servico_id) references produto (produto_id),
  constraint fk_nfse_item_3 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists nfse_substituta (
  nfse_id int(11) not null default '0',
  numero_rps int(11) not null default '0',
  serie_rps int(3) not null default '0',
  tipo_rps int(1) not null default '0',
  primary key (nfse_id),
  key k_nfse_substituta_1 (nfse_id),
  constraint fk_nfse_substituta_1 foreign key (nfse_id) references nfse (nfse_id)
) engine=innodb default charset=latin1;

create table if not exists numeracao (
  numeracao_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  tipo int(2) not null default '0',
  serie int(3) not null default '0',
  pdv_id int(11) default null,
  numero int(11) not null default '0',
  primary key (numeracao_id),
  unique key uk_numeracao_1 (empresa_id,tipo,serie),
  key k_numeracao_1 (empresa_id),
  key k_numeracao_2 (pdv_id),
  constraint fk_numeracao_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_numeracao_2 foreign key (pdv_id) references pdv (pdv_id)
) engine=innodb default charset=latin1;

create trigger bi_numeracao before insert on numeracao for each row
begin
    if new.tipo not in (1,2,3,4,5,6,7,8) then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.tipo';
    end if;
    if new.serie < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.serie';
    end if;
    if new.numero < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.numero';
    end if;
end;

create trigger bu_numeracao before update on numeracao for each row
begin
    if new.tipo not in (1,2,3,4,5,6,7,8) then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.tipo';
    end if;
    if new.serie < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.serie';
    end if;
    if new.numero < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.numero';
    end if;
end;

create table if not exists odf (
  odf_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  numero int(11) not null default '0',
  data_emissao date not null default '0001-01-01',
  data_entrada date not null default '0001-01-01',
  serie char(3) not null default '',
  modelo char(3) not null default '',
  situacao int(2) not null default '0',
  fornecedor_id int(11) not null default '0',
  pagamento int(11) not null default '0',
  valor_total decimal(15,2) not null default '0.00',
  valor_desconto decimal(15,2) not null default '0.00',
  valor_acrescimo decimal(15,2) not null default '0.00',
  cfop int(4) not null default '0',
  cst_icms char(3) not null default '',
  base_calculo_icms decimal(15,2) not null default '0.00',
  aliquota_icms decimal(8,4) not null default '0.0000',
  valor_icms decimal(15,2) not null default '0.00',
  cst_pis_cofins char(3) not null default '',
  base_calculo_pis_cofins decimal(15,2) not null default '0.00',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  valor_pis decimal(15,2) not null default '0.00',
  valor_cofins decimal(15,2) not null default '0.00',
  codigo_credito_pis_cofins int(3) not null default '0',
  natureza_bc_c_pis_cofins int(3) not null default '0',
  conta_contabil_id int(11) default null,
  classe_consumo_energia int(2) not null default '0',
  tipo_ligacao_eletrica int(1) not null default '0',
  grupo_tensao_eletrica int(2) not null default '0',
  tipo_assinatura int(1) not null default '0',
  classe_consumo_agua int(3) not null default '0',
  observacao text not null,
  primary key (odf_id),
  key k_odf_1 (empresa_id),
  key k_odf_2 (fornecedor_id),
  key k_odf_3 (conta_contabil_id),
  constraint fk_odf_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_odf_2 foreign key (fornecedor_id) references pessoa (pessoa_id),
  constraint fk_odf_3 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists operacao (
  operacao_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  nome varchar(50) not null default '',
  entrada_saida char(1) not null default '',
  movimenta_estoque tinyint(1) not null default '0',
  movimenta_financeiro tinyint(1) not null default '0',
  atualiza_precos tinyint(1) not null default '0',
  primary key (operacao_id),
  unique key uk_operacao_1 (codigo_interno)
) engine=innodb default charset=latin1;

create table if not exists operacao_categoria (
  operacao_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  tipo int(2) not null default '0',
  primary key (operacao_id,categoria_id),
  unique key uk_operacao_categoria_1 (operacao_id,tipo),
  key k_operacao_categoria_1 (operacao_id),
  key k_operacao_categoria_2 (categoria_id),
  constraint fk_operacao_categoria_1 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_operacao_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists operacao_empresa (
  operacao_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  conta_id int(11) default null,
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (operacao_id,empresa_id),
  key k_operacao_empresa_1 (operacao_id),
  key k_operacao_empresa_2 (empresa_id),
  key k_operacao_empresa_3 (conta_id),
  constraint fk_operacao_empresa_1 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_operacao_empresa_2 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_operacao_empresa_3 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade (
  oportunidade_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  pessoa_crm_id int(11) default null,
  conta_crm_id int(11) not null default '0',
  vendedor_id int(11) not null default '0',
  oportunidade_origem_id int(11) default null,
  oportunidade_solucao_id int(11) not null default '0',
  oportunidade_fase_id int(11) not null default '0',
  oportunidade_status_id int(11) not null default '0',
  oportunidade_motivo_id int(11) default null,
  oportunidade_tipo_id int(11) default null,
  descricao varchar(300) not null default '',
  valor_produtos decimal(15,2) not null default '0.00',
  valor_servicos decimal(15,2) not null default '0.00',
  valor_recorrencia decimal(15,2) not null default '0.00',
  meses_recorrencia int(3) not null default '0',
  valor_ticket decimal(15,2) not null default '0.00',
  entrada date not null default '0001-01-01',
  previsao date not null default '0001-01-01',
  conclusao date not null default '0001-01-01',
  chance_vitoria int(1) not null default '0',
  proximidade_conclusao int(1) not null default '0',
  observacao text not null,
  excluido tinyint(1) not null default '0',
  primary key (oportunidade_id),
  key k_oportunidade_1 (empresa_id),
  key k_oportunidade_2 (pessoa_crm_id),
  key k_oportunidade_3 (conta_crm_id),
  key k_oportunidade_4 (vendedor_id),
  key k_oportunidade_5 (oportunidade_origem_id),
  key k_oportunidade_6 (oportunidade_solucao_id),
  key k_oportunidade_7 (oportunidade_motivo_id),
  key k_oportunidade_8 (oportunidade_tipo_id),
  constraint fk_oportunidade_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_oportunidade_2 foreign key (pessoa_crm_id) references pessoa (pessoa_id),
  constraint fk_oportunidade_3 foreign key (conta_crm_id) references pessoa (pessoa_id),
  constraint fk_oportunidade_4 foreign key (vendedor_id) references pessoa (pessoa_id),
  constraint fk_oportunidade_5 foreign key (oportunidade_origem_id) references oportunidade_origem (oportunidade_origem_id),
  constraint fk_oportunidade_6 foreign key (oportunidade_solucao_id) references oportunidade_solucao (oportunidade_solucao_id),
  constraint fk_oportunidade_7 foreign key (oportunidade_motivo_id) references oportunidade_motivo (oportunidade_motivo_id),
  constraint fk_oportunidade_8 foreign key (oportunidade_tipo_id) references oportunidade_tipo (oportunidade_tipo_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_concorrente (
  oportunidade_id int(11) not null default '0',
  concorrente_id int(11) not null default '0',
  primary key (oportunidade_id,concorrente_id),
  key k_oportunidade_concorrente_1 (oportunidade_id),
  key k_oportunidade_concorrente_2 (concorrente_id),
  constraint fk_oportunidade_concorrente_1 foreign key (oportunidade_id) references oportunidade (oportunidade_id),
  constraint fk_oportunidade_concorrente_2 foreign key (concorrente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_motivo (
  oportunidade_motivo_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  descricao varchar(300) not null default '',
  tipo int(1) not null default '0',
  primary key (oportunidade_motivo_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_motivo_empresa (
  oportunidade_motivo_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (oportunidade_motivo_id,empresa_id),
  key k_oportunidade_motivo_empresa_1 (oportunidade_motivo_id),
  key k_oportunidade_motivo_empresa_2 (empresa_id),
  constraint fk_oportunidade_motivo_empresa_1 foreign key (oportunidade_motivo_id) references oportunidade_motivo (oportunidade_motivo_id),
  constraint fk_oportunidade_motivo_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_origem (
  oportunidade_origem_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  descricao varchar(300) not null default '',
  primary key (oportunidade_origem_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_origem_empresa (
  oportunidade_origem_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (oportunidade_origem_id,empresa_id),
  key k_oportunidade_origem_empresa_1 (oportunidade_origem_id),
  key k_oportunidade_origem_empresa_2 (empresa_id),
  constraint fk_oportunidade_origem_empresa_1 foreign key (oportunidade_origem_id) references oportunidade_origem (oportunidade_origem_id),
  constraint fk_oportunidade_origem_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_solucao (
  oportunidade_solucao_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  descricao varchar(300) not null default '',
  primary key (oportunidade_solucao_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_solucao_empresa (
  oportunidade_solucao_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (oportunidade_solucao_id,empresa_id),
  key k_oportunidade_solucao_empresa_1 (oportunidade_solucao_id),
  key k_oportunidade_solucao_empresa_2 (empresa_id),
  constraint fk_oportunidade_solucao_empresa_1 foreign key (oportunidade_solucao_id) references oportunidade_solucao (oportunidade_solucao_id),
  constraint fk_oportunidade_solucao_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_tarefa (
  oportunidade_id int(11) not null default '0',
  tarefa_id int(11) not null default '0',
  primary key (oportunidade_id,tarefa_id),
  key k_oportunidade_tarefa_1 (oportunidade_id),
  key k_oportunidade_tarefa_2 (tarefa_id),
  constraint fk_oportunidade_tarefa_1 foreign key (oportunidade_id) references oportunidade (oportunidade_id),
  constraint fk_oportunidade_tarefa_2 foreign key (tarefa_id) references tarefa (tarefa_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_tipo (
  oportunidade_tipo_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  descricao varchar(300) not null default '',
  primary key (oportunidade_tipo_id)
) engine=innodb default charset=latin1;

create table if not exists oportunidade_tipo_empresa (
  oportunidade_tipo_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (oportunidade_tipo_id,empresa_id),
  key k_oportunidade_tipo_empresa_1 (oportunidade_tipo_id),
  key k_oportunidade_tipo_empresa_2 (empresa_id),
  constraint fk_oportunidade_tipo_empresa_1 foreign key (oportunidade_tipo_id) references oportunidade_tipo (oportunidade_tipo_id),
  constraint fk_oportunidade_tipo_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists ordem_servico (
  ordem_servico_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  cliente_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  data_hora_abertura datetime not null default '0001-01-01 00:00:00',
  data_hora_previsao datetime not null default '0001-01-01 00:00:00',
  data_hora_entrega datetime not null default '0001-01-01 00:00:00',
  veiculo_id int(11) default null,
  veiculo_km decimal(15,2) not null default '0.00',
  equipamento_descricao varchar(100) not null default '',
  equipamento_numero_serie varchar(30) not null default '',
  equipamento_marca varchar(30) not null default '',
  equipamento_modelo varchar(30) not null default '',
  descricao_problema text not null,
  descricao_recebimento text not null,
  descricao_servico text not null,
  observacao text not null,
  status int(1) not null default '0',
  primary key (ordem_servico_id),
  key k_ordem_servico_1 (empresa_id),
  key k_ordem_servico_2 (cliente_id),
  key k_ordem_servico_3 (colaborador_id),
  key k_ordem_servico_4 (veiculo_id),
  constraint fk_ordem_servico_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_ordem_servico_2 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_ordem_servico_3 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_ordem_servico_4 foreign key (veiculo_id) references veiculo (veiculo_id)
) engine=innodb default charset=latin1;

create table if not exists ordem_servico_anexo (
  ordem_servico_anexo_id int(11) not null auto_increment,
  ordem_servico_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (ordem_servico_anexo_id),
  key k_ordem_servico_anexo_1 (ordem_servico_id),
  constraint fk_ordem_servico_anexo_1 foreign key (ordem_servico_id) references ordem_servico (ordem_servico_id)
) engine=innodb default charset=latin1;

create table if not exists ordem_servico_atividade (
  ordem_servico_atividade_id int(11) not null auto_increment,
  ordem_servico_id int(11) not null default '0',
  usuario_id int(11) default null,
  data_hora datetime not null default '0001-01-01 00:00:00',
  atividade int(2) not null default '0',
  colaborador_id int(11) default null,
  status int(1) not null default '0',
  data_hora_previsao datetime not null default '0001-01-01 00:00:00',
  data_hora_entrega datetime not null default '0001-01-01 00:00:00',
  ordem_servico_anexo_id int(11) default null,
  descricao_problema text not null,
  descricao_recebimento text not null,
  descricao_servico text not null,
  primary key (ordem_servico_atividade_id),
  key k_ordem_servico_atividade_1 (ordem_servico_id),
  key k_ordem_servico_atividade_2 (usuario_id),
  key k_ordem_servico_atividade_3 (colaborador_id),
  key k_ordem_servico_atividade_4 (ordem_servico_anexo_id),
  constraint fk_ordem_servico_atividade_1 foreign key (ordem_servico_id) references ordem_servico (ordem_servico_id),
  constraint fk_ordem_servico_atividade_3 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_ordem_servico_atividade_4 foreign key (ordem_servico_anexo_id) references ordem_servico_anexo (ordem_servico_anexo_id)
) engine=innodb default charset=latin1;

create table if not exists ordem_servico_comentario (
  ordem_servico_comentario_id int(11) not null auto_increment,
  ordem_servico_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  comentario text not null,
  publico tinyint(1) not null default '0',
  primary key (ordem_servico_comentario_id),
  key k_ordem_servico_comentario_1 (ordem_servico_id),
  key k_ordem_servico_comentario_2 (usuario_id),
  constraint fk_ordem_servico_comentario_1 foreign key (ordem_servico_id) references ordem_servico (ordem_servico_id)
) engine=innodb default charset=latin1;

create table if not exists pagamento (
  pagamento_id int(11) not null auto_increment,
  conta_id int(11) not null default '0',
  data date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  cancelado tinyint(1) not null default '0',
  primary key (pagamento_id),
  key k_pagamento_1 (conta_id),
  constraint fk_pagamento_1 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists pagamento_cancelado (
  pagamento_cancelado_id int(11) not null auto_increment,
  pagamento_id int(11) not null default '0',
  data date not null default '0001-01-01',
  primary key (pagamento_cancelado_id),
  key k_pagamento_cancelado_1 (pagamento_id),
  constraint fk_pagamento_cancelado_1 foreign key (pagamento_id) references pagamento (pagamento_id)
) engine=innodb default charset=latin1;

create table if not exists pagamento_cancelado_pagar (
  pagamento_cancelado_id int(11) not null default '0',
  pagamento_id int(11) not null default '0',
  pagar_id int(11) not null default '0',
  primary key (pagamento_cancelado_id,pagamento_id,pagar_id),
  key k_pagamento_cancelado_pagar_1 (pagamento_cancelado_id),
  key k_pagamento_cancelado_pagar_2 (pagamento_id),
  key k_pagamento_cancelado_pagar_3 (pagar_id),
  constraint fk_pagamento_cancelado_pagar_1 foreign key (pagamento_cancelado_id) references pagamento_cancelado (pagamento_cancelado_id),
  constraint fk_pagamento_cancelado_pagar_2 foreign key (pagamento_id) references pagamento (pagamento_id),
  constraint fk_pagamento_cancelado_pagar_3 foreign key (pagar_id) references pagar (pagar_id)
) engine=innodb default charset=latin1;

create table if not exists pagamento_pagar (
  pagamento_pagar_id int(11) not null auto_increment,
  pagamento_id int(11) not null default '0',
  pagar_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  cancelado tinyint(1) not null default '0',
  primary key (pagamento_pagar_id),
  unique key uk_pagamento_pagar_1 (pagamento_id,pagar_id),
  key k_pagamento_pagar_1 (pagamento_id),
  key k_pagamento_pagar_2 (pagar_id),
  constraint fk_pagamento_pagar_1 foreign key (pagamento_id) references pagamento (pagamento_id),
  constraint fk_pagamento_pagar_2 foreign key (pagar_id) references pagar (pagar_id)
) engine=innodb default charset=latin1;

create table if not exists pagamento_pagar_categoria (
  pagamento_pagar_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  primary key (pagamento_pagar_id,categoria_id),
  key k_pagamento_pagar_categoria_1 (pagamento_pagar_id),
  key k_pagamento_pagar_categoria_2 (categoria_id),
  constraint fk_pagamento_pagar_categoria_1 foreign key (pagamento_pagar_id) references pagamento_pagar (pagamento_pagar_id),
  constraint fk_pagamento_pagar_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists pagar (
  pagar_id int(11) not null auto_increment,
  importacao_pagar_id varchar(20) default null,
  empresa_id int(11) not null default '0',
  fornecedor_id int(11) not null default '0',
  compra_id int(11) default null,
  emprestimo_id int(11) default null,
  conta_id int(11) not null default '0',
  documento varchar(30) not null default '',
  emissao date not null default '0001-01-01',
  vencimento date not null default '0001-01-01',
  pagamento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  observacao text not null,
  substituido tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (pagar_id),
  key k_pagar_1 (empresa_id),
  key k_pagar_2 (fornecedor_id),
  key k_pagar_3 (compra_id),
  key k_pagar_4 (emprestimo_id),
  key k_pagar_5 (conta_id),
  constraint fk_pagar_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_pagar_2 foreign key (fornecedor_id) references pessoa (pessoa_id),
  constraint fk_pagar_3 foreign key (compra_id) references compra (compra_id),
  constraint fk_pagar_4 foreign key (emprestimo_id) references emprestimo (emprestimo_id),
  constraint fk_pagar_5 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists pagar_anexo (
  pagar_anexo_id int(11) not null auto_increment,
  pagar_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  primary key (pagar_anexo_id),
  key k_pagar_anexo_1 (pagar_id),
  constraint fk_pagar_anexo_1 foreign key (pagar_id) references pagar (pagar_id)
) engine=innodb default charset=latin1;

create table if not exists pagar_categoria (
  pagar_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (pagar_id,categoria_id),
  key k_pagar_categoria_1 (pagar_id),
  key k_pagar_categoria_2 (categoria_id),
  constraint fk_pagar_categoria_1 foreign key (pagar_id) references pagar (pagar_id),
  constraint fk_pagar_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists pagar_centro_resultado (
  pagar_id int(11) not null default '0',
  centro_resultado_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (pagar_id,centro_resultado_id),
  key k_pagar_centro_resultado_1 (pagar_id),
  key k_pagar_centro_resultado_2 (centro_resultado_id),
  constraint fk_pagar_centro_resultado_1 foreign key (pagar_id) references pagar (pagar_id),
  constraint fk_pagar_centro_resultado_2 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id)
) engine=innodb default charset=latin1;

create table if not exists pagar_substituido (
  pagar_id int(11) not null default '0',
  pagar_substituido_id int(11) not null default '0',
  primary key (pagar_id,pagar_substituido_id),
  key k_pagar_substituido_1 (pagar_id),
  key k_pagar_substituido_2 (pagar_substituido_id),
  constraint fk_pagar_substituido_1 foreign key (pagar_id) references pagar (pagar_id),
  constraint fk_pagar_substituido_2 foreign key (pagar_substituido_id) references pagar (pagar_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato (
  parceiro_contrato_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  parceiro_id int(11) not null default '0',
  codigo varchar(30) not null default '',
  descricao varchar(200) not null default '',
  atendimento int(1) not null default '0',
  faturamento int(1) not null default '0',
  financeiro int(1) not null default '0',
  remuneracao int(1) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  desconto decimal(8,4) not null default '0.0000',
  data_inicio date not null default '0001-01-01',
  data_fim date not null default '0001-01-01',
  documento_receber int(1) not null default '0',
  documento_fiscal int(1) not null default '0',
  observacao text not null,
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (parceiro_contrato_id),
  key k_parceiro_contrato_1 (empresa_id),
  key k_parceiro_contrato_2 (parceiro_id),
  constraint fk_parceiro_contrato_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_parceiro_contrato_2 foreign key (parceiro_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato_anexo (
  parceiro_contrato_anexo_id int(11) not null auto_increment,
  parceiro_contrato_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  primary key (parceiro_contrato_anexo_id),
  key k_parceiro_contrato_anexo_1 (parceiro_contrato_id),
  constraint fk_parceiro_contrato_anexo_1 foreign key (parceiro_contrato_id) references parceiro_contrato (parceiro_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato_cidade (
  cep varchar(10) not null default '',
  cidade varchar(50) not null default '',
  uf char(2) not null default '',
  parceiro_contrato_id int(11) not null default '0',
  exclusivo tinyint(1) not null default '0',
  primary key (cep),
  key k_parceiro_contrato_cidade_1 (parceiro_contrato_id),
  constraint fk_parceiro_contrato_cidade_1 foreign key (parceiro_contrato_id) references parceiro_contrato (parceiro_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato_conta (
  parceiro_contrato_id int(11) not null default '0',
  pagar_receber char(1) not null default '',
  conta_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  vencimento_tipo int(1) not null default '0',
  vencimento_dia int(2) not null default '0',
  primary key (parceiro_contrato_id,pagar_receber),
  key k_parceiro_contrato_conta_1 (conta_id),
  key k_parceiro_contrato_conta_2 (categoria_id),
  constraint fk_parceiro_contrato_conta_1 foreign key (conta_id) references conta (conta_id),
  constraint fk_parceiro_contrato_conta_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato_faixa (
  parceiro_contrato_faixa_id int(11) not null auto_increment,
  parceiro_contrato_id int(11) not null default '0',
  tipo int(1) not null default '0',
  minimo decimal(15,2) not null default '0.00',
  maximo decimal(15,2) not null default '0.00',
  percentual decimal(8,4) not null default '0.0000',
  primary key (parceiro_contrato_faixa_id),
  key k_parceiro_contrato_faixa_1 (parceiro_contrato_id),
  constraint fk_parceiro_contrato_faixa_1 foreign key (parceiro_contrato_id) references parceiro_contrato (parceiro_contrato_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato_produto (
  parceiro_contrato_produto_id int(11) not null auto_increment,
  parceiro_contrato_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  modulo_id int(11) not null default '0',
  base_calculo int(1) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (parceiro_contrato_produto_id),
  unique key uk_parceiro_contrato_produto_1 (parceiro_contrato_id,produto_id,modulo_id),
  key k_parceiro_contrato_produto_1 (parceiro_contrato_id),
  key k_parceiro_contrato_produto_2 (produto_id),
  key k_parceiro_contrato_produto_3 (modulo_id),
  constraint fk_parceiro_contrato_produto_1 foreign key (parceiro_contrato_id) references parceiro_contrato (parceiro_contrato_id),
  constraint fk_parceiro_contrato_produto_2 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists parceiro_contrato_servico (
  parceiro_contrato_servico_id int(11) not null auto_increment,
  parceiro_contrato_id int(11) not null default '0',
  servico_id int(11) not null default '0',
  base_calculo int(1) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (parceiro_contrato_servico_id),
  unique key uk_parceiro_contrato_servico_1 (parceiro_contrato_id,servico_id),
  key k_parceiro_contrato_servico_1 (parceiro_contrato_id),
  key k_parceiro_contrato_servico_2 (servico_id),
  constraint fk_parceiro_contrato_servico_1 foreign key (parceiro_contrato_id) references parceiro_contrato (parceiro_contrato_id),
  constraint fk_parceiro_contrato_servico_2 foreign key (servico_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists pdv (
  pdv_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  conta_id int(11) not null default '0',
  numero int(4) default null,
  identificador varchar(50) not null default '',
  nome varchar(100) not null default '',
  tipo int(1) not null default '0',
  ativo tinyint(1) not null default '0',
  primary key (pdv_id),
  unique key uk_pdv_1 (empresa_id,numero),
  key k_pdv_1 (empresa_id),
  key k_pdv_2 (usuario_id),
  key k_pdv_3 (conta_id),
  constraint fk_pdv_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_pdv_3 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists pessoa (
  pessoa_id int(11) not null auto_increment,
  fisica_juridica char(1) not null default '',
  regime_tributario int(1) not null default '0',
  nome_razao_social varchar(100) not null default '',
  nome_fantasia varchar(100) not null default '',
  cpf varchar(11) default null,
  identidade varchar(20) not null default '',
  cnpj varchar(14) default null,
  inscricao_estadual varchar(20) not null default '',
  inscricao_municipal varchar(20) not null default '',
  inscricao_estadual_produtor_rural varchar(20) not null default '',
  contribuinte int(1) not null default '0',
  crc varchar(15) not null default '',
  apelido varchar(30) not null default '',
  nome_pai varchar(100) not null default '',
  nome_mae varchar(100) not null default '',
  data_nascimento date not null default '0001-01-01',
  usuario_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (pessoa_id),
  unique key uk_pessoa_1 (cpf),
  unique key uk_pessoa_2 (cnpj),
  key k_pessoa_1 (usuario_id),
  key k_pessoa_2 (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists pessoa_contato (
  pessoa_contato_id int(11) not null auto_increment,
  pessoa_id int(11) not null default '0',
  empresa_contato_id int(11) not null default '0',
  tipo int(1) not null default '0',
  contato varchar(50) not null default '',
  observacao text not null,
  primary key (pessoa_contato_id),
  key k_pessoa_contato_1 (pessoa_id),
  key k_pessoa_contato_2 (empresa_contato_id),
  constraint fk_pessoa_contato_1 foreign key (pessoa_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists pessoa_empresa (
  pessoa_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  tipo int(2) not null default '0',
  veiculo_venda int(1) not null default '0',
  limite_credito decimal(15,2) not null default '0.00',
  valor_credito decimal(15,2) not null default '0.00',
  bloqueado tinyint(1) not null default '0',
  comissao decimal(6,2) not null default '0.00',
  vendedor_id int(11) default null,
  reserva date not null default '0001-01-01',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (pessoa_id,empresa_id,tipo),
  key k_pessoa_empresa_1 (pessoa_id),
  key k_pessoa_empresa_2 (empresa_id),
  key k_pessoa_empresa_3 (vendedor_id),
  constraint fk_pessoa_empresa_1 foreign key (pessoa_id) references pessoa (pessoa_id),
  constraint fk_pessoa_empresa_2 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_pessoa_empresa_3 foreign key (vendedor_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists pessoa_endereco (
  pessoa_endereco_id int(11) not null auto_increment,
  pessoa_id int(11) not null default '0',
  empresa_endereco_id int(11) not null default '0',
  logradouro varchar(100) not null default '',
  numero varchar(10) not null default '',
  bairro varchar(50) not null default '',
  complemento varchar(50) not null default '',
  cep varchar(10) not null default '',
  cidade varchar(50) not null default '',
  uf char(2) not null default '',
  codigo_municipio varchar(7) not null default '',
  observacao text not null,
  principal tinyint(1) not null default '0',
  primary key (pessoa_endereco_id),
  key k_pessoa_endereco_1 (pessoa_id),
  key k_pessoa_endereco_2 (empresa_endereco_id),
  constraint fk_pessoa_endereco_1 foreign key (pessoa_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists pessoa_tipo (
  pessoa_id int(11) not null default '0',
  importacao_pessoa_id varchar(20) default null,
  tipo int(2) not null default '0',
  observacao text not null,
  primary key (pessoa_id,tipo),
  key k_pessoa_tipo_1 (pessoa_id),
  constraint fk_pessoa_tipo_1 foreign key (pessoa_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists pessoa_veiculo (
  pessoa_id int(11) not null default '0',
  veiculo_id int(11) not null default '0',
  primary key (pessoa_id,veiculo_id),
  key k_pessoa_veiculo_1 (pessoa_id),
  key k_pessoa_veiculo_2 (veiculo_id),
  constraint fk_pessoa_veiculo_1 foreign key (pessoa_id) references pessoa (pessoa_id),
  constraint fk_pessoa_veiculo_2 foreign key (veiculo_id) references veiculo (veiculo_id)
) engine=innodb default charset=latin1;

create table if not exists pix (
  pix_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  valor decimal(15,2) not null default '0.00',
  tarifa decimal(15,2) not null default '0.00',
  status int(1) not null default '0',
  pensebank_hash varchar(50) not null default '',
  primary key (pix_id),
  key k_pix_1 (empresa_id),
  constraint fk_pix_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists plano_pagamento (
  plano_pagamento_id int(11) not null auto_increment,
  codigo_interno int(11) default null,
  nome varchar(50) not null default '',
  pagamento int(1) not null default '0',
  grupo_pagamento int(2) not null default '0',
  parcelamento int(1) not null default '0',
  vencimento int(3) not null default '0',
  edita tinyint(1) not null default '0',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (plano_pagamento_id),
  unique key uk_plano_pagamento_1 (codigo_interno)
) engine=innodb default charset=latin1;

create trigger bi_plano_pagamento before insert on plano_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.nome';
    end if;
    if new.pagamento not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.grupo_pagamento';
    end if;
    if new.parcelamento not in (0,1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.parcelamento';
    end if;
    if new.vencimento < 0 or new.vencimento > 31 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.vencimento';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.atualizado';
    end if;
end;

create trigger bu_plano_pagamento before update on plano_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.nome';
    end if;
    if new.pagamento not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.grupo_pagamento';
    end if;
    if new.parcelamento not in (0,1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.parcelamento';
    end if;
    if new.vencimento < 0 or new.vencimento > 31 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.vencimento';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.atualizado';
    end if;
end;

create table if not exists plano_pagamento_empresa (
  plano_pagamento_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (plano_pagamento_id,empresa_id),
  key k_plano_pagamento_empresa_1 (plano_pagamento_id),
  key k_plano_pagamento_empresa_2 (empresa_id),
  constraint fk_plano_pagamento_empresa_1 foreign key (plano_pagamento_id) references plano_pagamento (plano_pagamento_id),
  constraint fk_plano_pagamento_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists plano_pagamento_prazo (
  plano_pagamento_id int(11) not null default '0',
  prazo int(4) not null default '0',
  primary key (plano_pagamento_id,prazo),
  key k_plano_pagamento_prazo_1 (plano_pagamento_id),
  constraint fk_plano_pagamento_prazo_1 foreign key (plano_pagamento_id) references plano_pagamento (plano_pagamento_id)
) engine=innodb default charset=latin1;

create trigger bi_plano_pagamento_prazo before insert on plano_pagamento_prazo for each row
begin
    if new.prazo < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento_prazo.prazo';
    end if;
end;

create trigger bu_plano_pagamento_prazo before update on plano_pagamento_prazo for each row
begin
    if new.prazo < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento_prazo.prazo';
    end if;
end;

create table if not exists produto (
  produto_id int(11) not null auto_increment,
  importacao_produto_id varchar(20) default null,
  nome varchar(100) not null default '',
  descricao varchar(500) not null default '',
  tipo int(2) not null default '0',
  regra_tributaria_id int(11) default null,
  referencia varchar(30) not null default '',
  produto_grupo_id int(11) default null,
  produto_unidade_id int(11) default null,
  origem_cst int(11) not null default '0',
  codigo_ncm varchar(11) not null default '',
  codigo_cest varchar(8) not null default '',
  codigo_anp varchar(10) not null default '',
  codigo_codif varchar(10) not null default '',
  codigo_servico char(6) not null default '',
  ciap_vida_util int(11) not null default '0',
  ciap_numero_parcela int(11) not null default '0',
  ciap_funcao_bem text not null,
  embalagem int(11) not null default '0',
  url_imagem varchar(500) not null default '',
  interno tinyint(1) not null default '0',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (produto_id),
  key k_produto_1 (regra_tributaria_id),
  key k_produto_2 (produto_grupo_id),
  key k_produto_3 (produto_unidade_id),
  constraint fk_produto_1 foreign key (regra_tributaria_id) references regra_tributaria (regra_tributaria_id),
  constraint fk_produto_2 foreign key (produto_grupo_id) references produto_grupo (produto_grupo_id),
  constraint fk_produto_3 foreign key (produto_unidade_id) references produto_unidade (produto_unidade_id)
) engine=innodb default charset=latin1;

create table if not exists produto_codigo_ean (
  produto_codigo_ean_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  codigo_ean varchar(20) not null default '',
  primary key (produto_codigo_ean_id),
  unique key uk_produto_codigo_ean_1 (produto_id,produto_grade_id,codigo_ean),
  key k_produto_codigo_ean_1 (produto_id),
  key k_produto_codigo_ean_2 (produto_grade_id),
  constraint fk_produto_codigo_ean_1 foreign key (produto_id) references produto (produto_id),
  constraint fk_produto_codigo_ean_2 foreign key (produto_grade_id) references produto_grade (produto_grade_id)
) engine=innodb default charset=latin1;

create table if not exists produto_desconto (
  produto_desconto_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  tipo int(1) not null default '0',
  quantidade int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (produto_desconto_id),
  unique key uk_produto_desconto_1 (empresa_id,produto_id,tipo,quantidade),
  key k_produto_desconto_1 (empresa_id),
  key k_produto_desconto_2 (produto_id),
  constraint fk_produto_desconto_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_produto_desconto_2 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists produto_empresa (
  produto_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  enotas_codigo_servico int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (produto_id,empresa_id),
  key k_produto_empresa_1 (produto_id),
  key k_produto_empresa_2 (empresa_id),
  constraint fk_produto_empresa_1 foreign key (produto_id) references produto (produto_id),
  constraint fk_produto_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists produto_estoque (
  produto_estoque_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  empresa_id int(11) not null default '0',
  estoque_id int(11) not null default '0',
  localizacao varchar(50) not null default '',
  quantidade decimal(15,4) not null default '0.0000',
  compra decimal(15,4) not null default '0.0000',
  venda decimal(15,4) not null default '0.0000',
  primary key (produto_estoque_id),
  unique key uk_produto_estoque_1 (produto_id,produto_grade_id,produto_lote_id,empresa_id,estoque_id),
  key k_produto_estoque_1 (produto_id),
  key k_produto_estoque_2 (produto_grade_id),
  key k_produto_estoque_3 (produto_lote_id),
  key k_produto_estoque_4 (empresa_id),
  key k_produto_estoque_5 (estoque_id),
  constraint fk_produto_estoque_1 foreign key (produto_id) references produto (produto_id),
  constraint fk_produto_estoque_2 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_produto_estoque_3 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_produto_estoque_4 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_produto_estoque_5 foreign key (estoque_id) references estoque (estoque_id)
) engine=innodb default charset=latin1;

create table if not exists produto_fornecedor (
  produto_id int(11) not null default '0',
  fornecedor_id int(11) not null default '0',
  codigo_produto_fornecedor varchar(60) not null default '0',
  primary key (produto_id,fornecedor_id,codigo_produto_fornecedor),
  key k_produto_fornecedor_1 (produto_id),
  key k_produto_fornecedor_2 (fornecedor_id),
  constraint fk_produto_fornecedor_1 foreign key (produto_id) references produto (produto_id),
  constraint fk_produto_fornecedor_2 foreign key (fornecedor_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists produto_grade (
  produto_grade_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  grade varchar(30) not null default '',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (produto_grade_id),
  key k_produto_grade_1 (produto_id),
  constraint fk_produto_grade_1 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists produto_grupo (
  produto_grupo_id int(11) not null auto_increment,
  nome varchar(100) not null default '',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (produto_grupo_id)
) engine=innodb default charset=latin1;

create table if not exists produto_grupo_empresa (
  produto_grupo_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (produto_grupo_id,empresa_id),
  key k_produto_grupo_empresa_1 (produto_grupo_id),
  key k_produto_grupo_empresa_2 (empresa_id),
  constraint fk_produto_grupo_empresa_1 foreign key (produto_grupo_id) references produto_grupo (produto_grupo_id),
  constraint fk_produto_grupo_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists produto_inventario (
  produto_inventario_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  mes char(6) not null default '',
  quantidade decimal(15,4) not null default '0.0000',
  preco_custo_medio decimal(15,4) not null default '0.0000',
  primary key (produto_inventario_id),
  key k_produto_inventario_1 (empresa_id),
  key k_produto_inventario_2 (produto_id),
  constraint fk_produto_inventario_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_produto_inventario_2 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists produto_lote (
  produto_lote_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  lote varchar(20) not null default '',
  validade date not null default '0001-01-01',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (produto_lote_id),
  key k_produto_lote_1 (produto_id),
  constraint fk_produto_lote_1 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists produto_movimento (
  produto_movimento_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  empresa_id int(11) not null default '0',
  estoque_id int(11) not null default '0',
  compra_id int(11) default null,
  venda_id int(11) default null,
  devolucao_compra_id int(11) default null,
  devolucao_venda_id int(11) default null,
  nfe_id int(11) default null,
  data_hora_lancamento datetime not null default '0001-01-01 00:00:00',
  data_hora_movimento datetime not null default '0001-01-01 00:00:00',
  entrada_saida char(1) not null default '',
  quantidade decimal(15,4) not null default '0.0000',
  observacao text not null,
  primary key (produto_movimento_id),
  key k_produto_movimento_1 (produto_id),
  key k_produto_movimento_2 (produto_grade_id),
  key k_produto_movimento_3 (produto_lote_id),
  key k_produto_movimento_4 (empresa_id),
  key k_produto_movimento_5 (estoque_id),
  key k_produto_movimento_6 (compra_id),
  key k_produto_movimento_7 (venda_id),
  key k_produto_movimento_8 (devolucao_compra_id),
  key k_produto_movimento_9 (devolucao_venda_id),
  key k_produto_movimento_10 (nfe_id),
  constraint fk_produto_movimento_1 foreign key (produto_id) references produto (produto_id),
  constraint fk_produto_movimento_10 foreign key (nfe_id) references nfe (nfe_id),
  constraint fk_produto_movimento_2 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_produto_movimento_3 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_produto_movimento_4 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_produto_movimento_5 foreign key (estoque_id) references estoque (estoque_id),
  constraint fk_produto_movimento_6 foreign key (compra_id) references compra (compra_id),
  constraint fk_produto_movimento_7 foreign key (venda_id) references venda (venda_id),
  constraint fk_produto_movimento_8 foreign key (devolucao_compra_id) references devolucao_compra (devolucao_compra_id),
  constraint fk_produto_movimento_9 foreign key (devolucao_venda_id) references devolucao_venda (devolucao_venda_id)
) engine=innodb default charset=latin1;

create table if not exists produto_preco (
  produto_preco_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  modulo_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  empresa_id int(11) not null default '0',
  preco_custo decimal(15,4) not null default '0.0000',
  preco_custo_medio decimal(15,4) not null default '0.0000',
  preco_custo_ultimo decimal(15,4) not null default '0.0000',
  preco_venda decimal(15,4) not null default '0.0000',
  preco_venda_medio decimal(15,4) not null default '0.0000',
  preco_venda_ultimo decimal(15,4) not null default '0.0000',
  margem_lucro decimal(8,4) not null default '0.0000',
  primary key (produto_preco_id),
  unique key uk_produto_preco_1 (produto_id,modulo_id,produto_grade_id,empresa_id),
  key k_produto_preco_1 (produto_id),
  key k_produto_preco_2 (modulo_id),
  key k_produto_preco_3 (produto_grade_id),
  key k_produto_preco_4 (empresa_id),
  constraint fk_produto_preco_1 foreign key (produto_id) references produto (produto_id),
  constraint fk_produto_preco_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_produto_preco_4 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists produto_sped (
  produto_sped_id int(11) not null auto_increment,
  produto_id int(11) not null default '0',
  nome varchar(100) not null default '',
  data_inicio date not null default '0001-01-01',
  data_fim date not null default '0001-01-01',
  primary key (produto_sped_id),
  key k_produto_sped_1 (produto_id),
  constraint fk_produto_sped_1 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists produto_sped_empresa (
  produto_sped_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  sped int(1) not null default '0',
  mes char(6) not null default '',
  primary key (produto_sped_id,empresa_id,sped),
  key k_produto_sped_empresa_1 (produto_sped_id),
  key k_produto_sped_empresa_2 (empresa_id),
  constraint fk_produto_sped_empresa_1 foreign key (produto_sped_id) references produto_sped (produto_sped_id),
  constraint fk_produto_sped_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists produto_unidade (
  produto_unidade_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  simbolo varchar(6) not null default '',
  fraciona tinyint(1) not null default '0',
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (produto_unidade_id)
) engine=innodb default charset=latin1;

create table if not exists produto_unidade_empresa (
  produto_unidade_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (produto_unidade_id,empresa_id),
  key k_produto_unidade_empresa_1 (produto_unidade_id),
  key k_produto_unidade_empresa_2 (empresa_id),
  constraint fk_produto_unidade_empresa_1 foreign key (produto_unidade_id) references produto_unidade (produto_unidade_id),
  constraint fk_produto_unidade_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists projeto (
  projeto_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  codigo varchar(20) not null default '',
  nome varchar(100) not null default '',
  descricao varchar(500) not null default '',
  gerente_id int(11) not null default '0',
  data_inicio_previsto date not null default '0001-01-01',
  status int(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (projeto_id),
  key k_projeto_1 (empresa_id),
  key k_projeto_2 (gerente_id),
  constraint fk_projeto_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_projeto_2 foreign key (gerente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists projeto_colaborador (
  projeto_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  custo_hora decimal(15,2) not null default '0.00',
  valor_hora decimal(15,2) not null default '0.00',
  primary key (projeto_id,colaborador_id),
  key k_projeto_colaborador_1 (projeto_id),
  key k_projeto_colaborador_2 (colaborador_id),
  constraint fk_projeto_colaborador_1 foreign key (projeto_id) references projeto (projeto_id),
  constraint fk_projeto_colaborador_2 foreign key (colaborador_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists projeto_colaborador_dedicacao (
  projeto_id int(11) not null default '0',
  colaborador_id int(11) not null default '0',
  dia_semana int(1) not null default '0',
  tempo_dedicado int(11) not null default '0',
  primary key (projeto_id,colaborador_id,dia_semana),
  key k_projeto_colaborador_dedicacao_1 (projeto_id),
  key k_projeto_colaborador_dedicacao_2 (colaborador_id),
  constraint fk_projeto_colaborador_dedicacao_1 foreign key (projeto_id) references projeto (projeto_id),
  constraint fk_projeto_colaborador_dedicacao_2 foreign key (colaborador_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists projeto_etapa (
  projeto_etapa_id int(11) not null auto_increment,
  projeto_id int(11) not null default '0',
  descricao varchar(100) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (projeto_etapa_id),
  key k_projeto_etapa_1 (projeto_id),
  constraint fk_projeto_etapa_1 foreign key (projeto_id) references projeto (projeto_id)
) engine=innodb default charset=latin1;

create table if not exists projeto_ocorrencia (
  projeto_ocorrencia_id int(11) not null auto_increment,
  projeto_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  descricao varchar(200) not null default '',
  status_projeto int(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (projeto_ocorrencia_id),
  key k_projeto_ocorrencia_1 (projeto_id),
  constraint fk_projeto_ocorrencia_1 foreign key (projeto_id) references projeto (projeto_id)
) engine=innodb default charset=latin1;

create table if not exists projeto_tarefa (
  projeto_etapa_id int(11) not null default '0',
  tarefa_id int(11) not null default '0',
  primary key (projeto_etapa_id,tarefa_id),
  key k_projeto_tarefa_1 (projeto_etapa_id),
  key k_projeto_tarefa_2 (tarefa_id),
  constraint fk_projeto_tarefa_1 foreign key (projeto_etapa_id) references projeto_etapa (projeto_etapa_id),
  constraint fk_projeto_tarefa_2 foreign key (tarefa_id) references tarefa (tarefa_id)
) engine=innodb default charset=latin1;

create table if not exists receber (
  receber_id int(11) not null auto_increment,
  importacao_receber_id varchar(20) default null,
  empresa_id int(11) not null default '0',
  cliente_id int(11) not null default '0',
  parceiro_id int(11) default null,
  venda_id int(11) default null,
  conta_id int(11) not null default '0',
  documento varchar(50) not null default '',
  emissao date not null default '0001-01-01',
  vencimento date not null default '0001-01-01',
  pagamento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  parceiro_percentual decimal(8,4) not null default '0.0000',
  observacao text not null,
  substituido tinyint(1) not null default '0',
  perdido tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (receber_id),
  key k_receber_1 (empresa_id),
  key k_receber_2 (cliente_id),
  key k_receber_3 (parceiro_id),
  key k_receber_4 (venda_id),
  key k_receber_5 (conta_id),
  constraint fk_receber_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_receber_2 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_receber_3 foreign key (parceiro_id) references pessoa (pessoa_id),
  constraint fk_receber_4 foreign key (venda_id) references venda (venda_id),
  constraint fk_receber_5 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists receber_anexo (
  receber_anexo_id int(11) not null auto_increment,
  receber_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  primary key (receber_anexo_id),
  key k_receber_anexo_1 (receber_id),
  constraint fk_receber_anexo_1 foreign key (receber_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists receber_boleto (
  receber_boleto_id int(11) not null auto_increment,
  receber_id int(11) not null default '0',
  nosso_numero varchar(20) not null default '',
  emissao date not null default '0001-01-01',
  vencimento date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  juros_diario decimal(8,4) not null default '0.0000',
  juros_carencia int(4) not null default '0',
  multa decimal(8,4) not null default '0.0000',
  multa_carencia int(4) not null default '0',
  url_boleto varchar(500) not null default '',
  url_remessa varchar(500) not null default '',
  url_retorno varchar(500) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (receber_boleto_id),
  key k_receber_boleto_1 (receber_id),
  constraint fk_receber_boleto_1 foreign key (receber_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists receber_categoria (
  receber_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (receber_id,categoria_id),
  key k_receber_categoria_1 (receber_id),
  key k_receber_categoria_2 (categoria_id),
  constraint fk_receber_categoria_1 foreign key (receber_id) references receber (receber_id),
  constraint fk_receber_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists receber_centro_resultado (
  receber_id int(11) not null default '0',
  centro_resultado_id int(11) not null default '0',
  percentual decimal(8,4) not null default '0.0000',
  primary key (receber_id,centro_resultado_id),
  key k_receber_centro_resultado_1 (receber_id),
  key k_receber_centro_resultado_2 (centro_resultado_id),
  constraint fk_receber_centro_resultado_1 foreign key (receber_id) references receber (receber_id),
  constraint fk_receber_centro_resultado_2 foreign key (centro_resultado_id) references centro_resultado (centro_resultado_id)
) engine=innodb default charset=latin1;

create table if not exists receber_substituido (
  receber_id int(11) not null default '0',
  receber_substituido_id int(11) not null default '0',
  primary key (receber_id,receber_substituido_id),
  key k_receber_substituido_1 (receber_id),
  key k_receber_substituido_2 (receber_substituido_id),
  constraint fk_receber_substituido_1 foreign key (receber_id) references receber (receber_id),
  constraint fk_receber_substituido_2 foreign key (receber_substituido_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists recebimento (
  recebimento_id int(11) not null auto_increment,
  conta_id int(11) not null default '0',
  data date not null default '0001-01-01',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  cancelado tinyint(1) not null default '0',
  primary key (recebimento_id),
  key k_recebimento_1 (conta_id),
  constraint fk_recebimento_1 foreign key (conta_id) references conta (conta_id)
) engine=innodb default charset=latin1;

create table if not exists recebimento_cancelado (
  recebimento_cancelado_id int(11) not null auto_increment,
  recebimento_id int(11) not null default '0',
  data date not null default '0001-01-01',
  primary key (recebimento_cancelado_id),
  key k_recebimento_cancelado_1 (recebimento_id),
  constraint fk_recebimento_cancelado_1 foreign key (recebimento_id) references recebimento (recebimento_id)
) engine=innodb default charset=latin1;

create table if not exists recebimento_cancelado_receber (
  recebimento_cancelado_id int(11) not null default '0',
  recebimento_id int(11) not null default '0',
  receber_id int(11) not null default '0',
  primary key (recebimento_cancelado_id,recebimento_id,receber_id),
  key k_recebimento_cancelado_receber_1 (recebimento_cancelado_id),
  key k_recebimento_cancelado_receber_2 (recebimento_id),
  key k_recebimento_cancelado_receber_3 (receber_id),
  constraint fk_recebimento_cancelado_receber_1 foreign key (recebimento_cancelado_id) references recebimento_cancelado (recebimento_cancelado_id),
  constraint fk_recebimento_cancelado_receber_2 foreign key (recebimento_id) references recebimento (recebimento_id),
  constraint fk_recebimento_cancelado_receber_3 foreign key (receber_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists recebimento_informado (
  receber_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  pagamento date not null default '0001-01-01',
  primary key (receber_id),
  key k_recebimento_informado_1 (receber_id),
  key k_recebimento_informado_2 (usuario_id),
  constraint fk_recebimento_informado_1 foreign key (receber_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists recebimento_receber (
  recebimento_receber_id int(11) not null auto_increment,
  recebimento_id int(11) not null default '0',
  receber_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  desconto decimal(15,2) not null default '0.00',
  acrescimo decimal(15,2) not null default '0.00',
  valor_pago decimal(15,2) not null default '0.00',
  cancelado tinyint(1) not null default '0',
  primary key (recebimento_receber_id),
  unique key uk_recebimento_receber_1 (recebimento_id,receber_id),
  key k_recebimento_receber_1 (recebimento_id),
  key k_recebimento_receber_2 (receber_id),
  constraint fk_recebimento_receber_1 foreign key (recebimento_id) references recebimento (recebimento_id),
  constraint fk_recebimento_receber_2 foreign key (receber_id) references receber (receber_id)
) engine=innodb default charset=latin1;

create table if not exists recebimento_receber_categoria (
  recebimento_receber_id int(11) not null default '0',
  categoria_id int(11) not null default '0',
  valor decimal(15,2) not null default '0.00',
  primary key (recebimento_receber_id,categoria_id),
  key k_recebimento_receber_categoria_1 (recebimento_receber_id),
  key k_recebimento_receber_categoria_2 (categoria_id),
  constraint fk_recebimento_receber_categoria_1 foreign key (recebimento_receber_id) references recebimento_receber (recebimento_receber_id),
  constraint fk_recebimento_receber_categoria_2 foreign key (categoria_id) references categoria (categoria_id)
) engine=innodb default charset=latin1;

create table if not exists regra_tributaria (
  regra_tributaria_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  produto_servico char(1) not null default '',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (regra_tributaria_id)
) engine=innodb default charset=latin1;

create table if not exists regra_tributaria_operacao (
  regra_tributaria_operacao_id int(11) not null auto_increment,
  regra_tributaria_id int(11) not null default '0',
  operacao_id int(11) not null default '0',
  regime_tributario int(1) not null default '0',
  uf char(2) not null default '',
  nome varchar(100) not null default '',
  cfop int(4) not null default '0',
  cst_icms char(3) not null default '',
  modalidade_bc_icms int(1) not null default '0',
  percentual_bc_icms decimal(8,4) not null default '0.0000',
  aliquota_icms decimal(8,4) not null default '0.0000',
  percentual_diferimento_icms decimal(8,4) not null default '0.0000',
  deduz_desconto_bc_icms tinyint(1) not null default '0',
  soma_frete_bc_icms tinyint(1) not null default '0',
  soma_seguro_bc_icms tinyint(1) not null default '0',
  soma_out_desp_bc_icms tinyint(1) not null default '0',
  modalidade_bc_icms_st int(1) not null default '0',
  percentual_bc_icms_st decimal(8,4) not null default '0.0000',
  aliquota_icms_st decimal(8,4) not null default '0.0000',
  aliquota_icms_st_interestadual decimal(8,4) not null default '0.0000',
  deduz_desconto_bc_icms_st tinyint(1) not null default '0',
  soma_frete_bc_icms_st tinyint(1) not null default '0',
  soma_seguro_bc_icms_st tinyint(1) not null default '0',
  soma_out_desp_bc_icms_st tinyint(1) not null default '0',
  soma_ipi_bc_icms_st tinyint(1) not null default '0',
  mva_icms_st decimal(8,4) not null default '0.0000',
  cst_ipi char(3) not null default '',
  aliquota_ipi decimal(8,4) not null default '0.0000',
  deduz_desconto_bc_ipi tinyint(1) not null default '0',
  soma_frete_bc_ipi tinyint(1) not null default '0',
  soma_seguro_bc_ipi tinyint(1) not null default '0',
  soma_out_desp_bc_ipi tinyint(1) not null default '0',
  tipo_tributacao_servico int(1) not null default '0',
  natureza_tributacao_servico int(1) not null default '0',
  aliquota_iss decimal(8,4) not null default '0.0000',
  iss_retido tinyint(1) not null default '0',
  exigibilidade_iss int(1) not null default '0',
  operacao_servico int(1) not null default '0',
  codigo_cnae varchar(10) not null default '',
  cst_pis_cofins char(3) not null default '',
  aliquota_pis decimal(8,4) not null default '0.0000',
  aliquota_cofins decimal(8,4) not null default '0.0000',
  deduz_desconto_bc_pis_cofins tinyint(1) not null default '0',
  soma_frete_bc_pis_cofins tinyint(1) not null default '0',
  soma_seguro_bc_pis_cofins tinyint(1) not null default '0',
  soma_out_desp_bc_pis_cofins tinyint(1) not null default '0',
  codigo_credito_pis_cofins int(3) not null default '0',
  natureza_bc_c_pis_cofins int(3) not null default '0',
  codigo_contribuicao_pis_cofins int(3) not null default '0',
  natureza_receita_pis_cofins char(3) not null default '',
  calcular_mva_ajustada tinyint(1) not null default '0',
  fcp_percentual_icms decimal(8,4) not null default '0.0000',
  fcp_percentual_icms_st decimal(8,4) not null default '0.0000',
  fcp_percentual_icms_st_retido decimal(8,4) not null default '0.0000',
  fcp_aliquota_icms_st_retido decimal(8,4) not null default '0.0000',
  codigo_tributacao_municipio varchar(20) not null default '',
  conta_contabil_id int(11) default null,
  observacao text not null,
  primary key (regra_tributaria_operacao_id),
  key k_regra_tributaria_operacao_1 (regra_tributaria_id),
  key k_regra_tributaria_operacao_2 (operacao_id),
  key k_regra_tributaria_operacao_3 (conta_contabil_id),
  constraint fk_regra_tributaria_operacao_1 foreign key (regra_tributaria_id) references regra_tributaria (regra_tributaria_id),
  constraint fk_regra_tributaria_operacao_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_regra_tributaria_operacao_3 foreign key (conta_contabil_id) references conta_contabil (conta_contabil_id)
) engine=innodb default charset=latin1;

create table if not exists regra_tributaria_operacao_empresa (
  regra_tributaria_operacao_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  primary key (regra_tributaria_operacao_id,empresa_id),
  key k_regra_tributaria_empresa_operacao_1 (regra_tributaria_operacao_id),
  key k_regra_tributaria_empresa_operacao_2 (empresa_id),
  constraint fk_regra_tributaria_empresa_operacao_1 foreign key (regra_tributaria_operacao_id) references regra_tributaria_operacao (regra_tributaria_operacao_id),
  constraint fk_regra_tributaria_empresa_operacao_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists relatorio (
  relatorio_id int(11) not null auto_increment,
  nome varchar(100) not null default '',
  tipo int(1) not null default '0',
  tabela_referencia_id char(5) not null default '',
  modulo_id int(11) not null default '0',
  primary key (relatorio_id),
  unique key uk_relatorio_1 (nome),
  key k_relatorio_1 (modulo_id)
) engine=innodb default charset=latin1;

create table if not exists relatorio_campo (
  relatorio_campo_id int(11) not null auto_increment,
  relatorio_id int(11) not null default '0',
  campo_id char(10) not null default '',
  ordem int(2) not null default '0',
  nome_personalizado varchar(50) not null default '',
  totalizar tinyint(1) not null default '0',
  agrupar tinyint(1) not null default '0',
  ordenar tinyint(1) not null default '0',
  primary key (relatorio_campo_id),
  key k_relatorio_campo_1 (relatorio_id),
  constraint fk_relatorio_campo_1 foreign key (relatorio_id) references relatorio (relatorio_id)
) engine=innodb default charset=latin1;

create table if not exists relatorio_campo_calculado (
  relatorio_campo_calculado_id int(11) not null auto_increment,
  relatorio_id int(11) not null default '0',
  numero_campo_calculado int(11) not null default '0',
  formula text not null,
  ordem int(2) not null default '0',
  nome_personalizado varchar(50) not null default '',
  totalizar tinyint(1) not null default '0',
  ordenar tinyint(1) not null default '0',
  primary key (relatorio_campo_calculado_id),
  key k_relatorio_campo_calculado_1 (relatorio_id),
  constraint fk_relatorio_campo_calculado_1 foreign key (relatorio_id) references relatorio (relatorio_id)
) engine=innodb default charset=latin1;

create table if not exists relatorio_empresa (
  relatorio_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  primary key (relatorio_id,empresa_id),
  key k_relatorio_empresa_1 (relatorio_id),
  key k_relatorio_empresa_2 (empresa_id),
  constraint fk_relatorio_empresa_1 foreign key (relatorio_id) references relatorio (relatorio_id),
  constraint fk_relatorio_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists relatorio_parametro (
  relatorio_parametro_id int(11) not null auto_increment,
  relatorio_id int(11) not null default '0',
  tipo int(1) not null default '0',
  campo_id char(10) not null default '',
  numero_campo_calculado int(11) not null default '0',
  operador_relacional int(1) not null default '0',
  operador_logico int(1) not null default '0',
  valor varchar(20) not null default '',
  primary key (relatorio_parametro_id),
  key k_relatorio_parametro_1 (relatorio_id),
  constraint fk_relatorio_parametro_1 foreign key (relatorio_id) references relatorio (relatorio_id)
) engine=innodb default charset=latin1;

create table if not exists relatorio_usuario (
  relatorio_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  permissao int(1) not null default '0',
  primary key (relatorio_id,usuario_id),
  key k_relatorio_usuario_1 (relatorio_id),
  key k_relatorio_usuario_2 (usuario_id),
  constraint fk_relatorio_usuario_1 foreign key (relatorio_id) references relatorio (relatorio_id)
) engine=innodb default charset=latin1;

create table if not exists service_empresa (
  service_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  versao_id int(11) not null default '0',
  job_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  primary key (service_id,empresa_id),
  key k_service_empresa_1 (service_id),
  key k_service_empresa_2 (empresa_id),
  key k_service_empresa_3 (versao_id),
  key k_service_empresa_4 (job_id),
  constraint fk_service_empresa_2 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_service_empresa_3 foreign key (versao_id) references versao (versao_id)
) engine=innodb default charset=latin1;

create table if not exists sla (
  sla_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  descricao varchar(200) not null default '',
  percentual decimal(8,4) not null default '0.0000',
  atende_feriado tinyint(1) not null default '0',
  atende_horario_especial tinyint(1) not null default '0',
  tempo_espera_prioridade_critica int(11) not null default '0',
  tempo_espera_prioridade_alta int(11) not null default '0',
  tempo_espera_prioridade_media int(11) not null default '0',
  tempo_espera_prioridade_baixa int(11) not null default '0',
  padrao tinyint(1) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (sla_id),
  key k_sla_1 (empresa_id),
  constraint fk_sla_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists sla_equipe (
  sla_id int(11) not null default '0',
  equipe_id int(11) not null default '0',
  nivel int(1) not null default '0',
  primary key (sla_id,equipe_id),
  key k_sla_equipe_1 (sla_id),
  key k_sla_equipe_2 (equipe_id),
  constraint fk_sla_equipe_1 foreign key (sla_id) references sla (sla_id),
  constraint fk_sla_equipe_2 foreign key (equipe_id) references equipe (equipe_id)
) engine=innodb default charset=latin1;

create table if not exists sla_horario (
  sla_id int(11) not null default '0',
  dia_semana int(1) not null default '0',
  hora_inicial time not null default '00:00:00',
  hora_intervalo_inicial time not null default '00:00:00',
  hora_intervalo_final time not null default '00:00:00',
  hora_final time not null default '00:00:00',
  primary key (sla_id,dia_semana),
  key k_sla_horario_1 (sla_id),
  constraint fk_sla_horario_1 foreign key (sla_id) references sla (sla_id)
) engine=innodb default charset=latin1;

create table if not exists sla_nivel (
  sla_id int(11) not null default '0',
  nivel int(1) not null default '0',
  tempo_solucao_prioridade_critica int(11) not null default '0',
  tempo_solucao_prioridade_alta int(11) not null default '0',
  tempo_solucao_prioridade_media int(11) not null default '0',
  tempo_solucao_prioridade_baixa int(11) not null default '0',
  primary key (sla_id,nivel),
  key k_sla_nivel_1 (sla_id),
  constraint fk_sla_nivel_1 foreign key (sla_id) references sla (sla_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao (
  solicitacao_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  descricao text not null,
  cliente_id int(11) default null,
  solicitante_id int(11) default null,
  usuario_id int(11) not null default '0',
  colaborador_id int(11) default null,
  departamento_id int(11) default null,
  equipe_id int(11) default null,
  cliente_contrato_id int(11) default null,
  produto_id int(11) default null,
  servico_id int(11) default null,
  sla_id int(11) default null,
  solicitacao_categoria_id int(11) not null default '0',
  solicitacao_origem_id int(11) default null,
  solicitacao_tipo_id int(1) not null default '0',
  projeto_id int(11) default null,
  status int(1) not null default '0',
  urgencia int(1) not null default '0',
  impacto int(1) not null default '0',
  prioridade int(1) not null default '0',
  nivel int(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (solicitacao_id),
  key k_solicitacao_1 (empresa_id),
  key k_solicitacao_2 (cliente_id),
  key k_solicitacao_3 (solicitante_id),
  key k_solicitacao_4 (usuario_id),
  key k_solicitacao_5 (colaborador_id),
  key k_solicitacao_6 (departamento_id),
  key k_solicitacao_7 (equipe_id),
  key k_solicitacao_8 (cliente_contrato_id),
  key k_solicitacao_9 (produto_id),
  key k_solicitacao_10 (servico_id),
  key k_solicitacao_11 (sla_id),
  key k_solicitacao_12 (solicitacao_categoria_id),
  key k_solicitacao_13 (solicitacao_origem_id),
  key k_solicitacao_14 (solicitacao_tipo_id),
  key k_solicitacao_15 (projeto_id),
  constraint fk_solicitacao_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_solicitacao_10 foreign key (servico_id) references produto (produto_id),
  constraint fk_solicitacao_11 foreign key (sla_id) references sla (sla_id),
  constraint fk_solicitacao_12 foreign key (solicitacao_categoria_id) references solicitacao_categoria (solicitacao_categoria_id),
  constraint fk_solicitacao_13 foreign key (solicitacao_origem_id) references solicitacao_origem (solicitacao_origem_id),
  constraint fk_solicitacao_14 foreign key (solicitacao_tipo_id) references solicitacao_tipo (solicitacao_tipo_id),
  constraint fk_solicitacao_15 foreign key (projeto_id) references projeto (projeto_id),
  constraint fk_solicitacao_2 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_solicitacao_3 foreign key (solicitante_id) references pessoa (pessoa_id),
  constraint fk_solicitacao_5 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_solicitacao_6 foreign key (departamento_id) references departamento (departamento_id),
  constraint fk_solicitacao_7 foreign key (equipe_id) references equipe (equipe_id),
  constraint fk_solicitacao_8 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id),
  constraint fk_solicitacao_9 foreign key (produto_id) references produto (produto_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_anexo (
  solicitacao_anexo_id int(11) not null auto_increment,
  solicitacao_id int(11) not null default '0',
  url_anexo varchar(500) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (solicitacao_anexo_id),
  key k_solicitacao_anexo_1 (solicitacao_id),
  constraint fk_solicitacao_anexo_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_atividade (
  solicitacao_atividade_id int(11) not null auto_increment,
  solicitacao_id int(11) not null default '0',
  usuario_id int(11) default null,
  data_hora datetime not null default '0001-01-01 00:00:00',
  atividade int(2) not null default '0',
  colaborador_id int(11) default null,
  departamento_id int(11) default null,
  equipe_id int(11) default null,
  solicitacao_status int(1) not null default '0',
  solicitacao_tipo_id int(11) default null,
  solicitacao_categoria_id int(11) default null,
  urgencia int(1) not null default '0',
  impacto int(1) not null default '0',
  prioridade int(1) not null default '0',
  nivel int(1) not null default '0',
  tarefa_id int(11) default null,
  tarefa_status int(1) not null default '0',
  compromisso_id int(11) default null,
  compromisso_data_hora_inicio datetime not null default '0001-01-01 00:00:00',
  compromisso_data_hora_fim datetime not null default '0001-01-01 00:00:00',
  solicitacao_anexo_id int(11) default null,
  cliente_contrato_id int(11) default null,
  produto_id int(11) default null,
  servico_id int(11) default null,
  primary key (solicitacao_atividade_id),
  key k_solicitacao_atividade_1 (solicitacao_id),
  key k_solicitacao_atividade_2 (usuario_id),
  key k_solicitacao_atividade_3 (colaborador_id),
  key k_solicitacao_atividade_4 (departamento_id),
  key k_solicitacao_atividade_5 (equipe_id),
  key k_solicitacao_atividade_6 (solicitacao_tipo_id),
  key k_solicitacao_atividade_7 (solicitacao_categoria_id),
  key k_solicitacao_atividade_8 (tarefa_id),
  key k_solicitacao_atividade_9 (compromisso_id),
  key k_solicitacao_atividade_10 (solicitacao_anexo_id),
  key k_solicitacao_atividade_11 (cliente_contrato_id),
  key k_solicitacao_atividade_12 (produto_id),
  key k_solicitacao_atividade_13 (servico_id),
  constraint fk_solicitacao_atividade_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id),
  constraint fk_solicitacao_atividade_10 foreign key (solicitacao_anexo_id) references solicitacao_anexo (solicitacao_anexo_id),
  constraint fk_solicitacao_atividade_11 foreign key (cliente_contrato_id) references cliente_contrato (cliente_contrato_id),
  constraint fk_solicitacao_atividade_12 foreign key (produto_id) references produto (produto_id),
  constraint fk_solicitacao_atividade_13 foreign key (servico_id) references produto (produto_id),
  constraint fk_solicitacao_atividade_3 foreign key (colaborador_id) references pessoa (pessoa_id),
  constraint fk_solicitacao_atividade_4 foreign key (departamento_id) references departamento (departamento_id),
  constraint fk_solicitacao_atividade_5 foreign key (equipe_id) references equipe (equipe_id),
  constraint fk_solicitacao_atividade_6 foreign key (solicitacao_tipo_id) references solicitacao_tipo (solicitacao_tipo_id),
  constraint fk_solicitacao_atividade_7 foreign key (solicitacao_categoria_id) references solicitacao_categoria (solicitacao_categoria_id),
  constraint fk_solicitacao_atividade_8 foreign key (tarefa_id) references tarefa (tarefa_id),
  constraint fk_solicitacao_atividade_9 foreign key (compromisso_id) references compromisso (compromisso_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_avaliacao (
  solicitacao_avaliacao_id int(11) not null auto_increment,
  solicitacao_id int(11) not null default '0',
  avaliador_id int(11) not null default '0',
  colaborador_id int(11) default null,
  nota int(1) not null default '0',
  comentario varchar(300) not null default '',
  primary key (solicitacao_avaliacao_id),
  unique key uk_solicitacao_avaliacao_1 (solicitacao_id,avaliador_id,colaborador_id),
  key k_solicitacao_avaliacao_1 (solicitacao_id),
  key k_solicitacao_avaliacao_2 (avaliador_id),
  key k_solicitacao_avaliacao_3 (colaborador_id),
  constraint fk_solicitacao_avaliacao_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id),
  constraint fk_solicitacao_avaliacao_3 foreign key (colaborador_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_categoria (
  solicitacao_categoria_id int(11) not null auto_increment,
  descricao varchar(100) not null default '',
  primary key (solicitacao_categoria_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_categoria_empresa (
  solicitacao_categoria_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (solicitacao_categoria_id,empresa_id),
  key k_solicitacao_categoria_empresa_1 (solicitacao_categoria_id),
  key k_solicitacao_categoria_empresa_2 (empresa_id),
  constraint fk_solicitacao_categoria_empresa_1 foreign key (solicitacao_categoria_id) references solicitacao_categoria (solicitacao_categoria_id),
  constraint fk_solicitacao_categoria_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_cobranca (
  solicitacao_cobranca_id int(11) not null auto_increment,
  solicitacao_id int(11) not null default '0',
  nome varchar(100) not null default '',
  url_documento varchar(500) not null default '',
  inicio date not null default '0001-01-01',
  fim date not null default '0001-01-01',
  primary key (solicitacao_cobranca_id),
  unique key uk_solicitacao_cobranca_1 (solicitacao_id,nome),
  key k_solicitacao_cobranca_1 (solicitacao_id),
  constraint fk_solicitacao_cobranca_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_comentario (
  solicitacao_comentario_id int(11) not null auto_increment,
  solicitacao_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  comentario text not null,
  publico tinyint(1) not null default '0',
  primary key (solicitacao_comentario_id),
  key k_solicitacao_comentario_1 (solicitacao_id),
  key k_solicitacao_comentario_2 (usuario_id),
  constraint fk_solicitacao_comentario_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_documento (
  solicitacao_id int(11) not null default '0',
  documento_id int(11) not null default '0',
  url_documento varchar(500) not null default '',
  vencimento date not null default '0001-01-01',
  entrega date not null default '0001-01-01',
  competencia char(6) not null default '',
  multa tinyint(1) not null default '0',
  primary key (solicitacao_id,documento_id),
  key k_solicitacao_documento_1 (solicitacao_id),
  key k_solicitacao_documento_2 (documento_id),
  constraint fk_solicitacao_documento_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id),
  constraint fk_solicitacao_documento_2 foreign key (documento_id) references documento (documento_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_lista (
  solicitacao_lista_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  nome varchar(100) not null default '',
  excluido tinyint(1) not null default '0',
  primary key (solicitacao_lista_id),
  key k_solicitacao_lista_1 (empresa_id),
  key k_solicitacao_lista_2 (usuario_id),
  constraint fk_solicitacao_lista_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_lista_item (
  solicitacao_lista_id int(11) not null default '0',
  solicitacao_id int(11) not null default '0',
  ordem int(11) not null default '0',
  primary key (solicitacao_lista_id,solicitacao_id),
  key k_solicitacao_lista_item_1 (solicitacao_lista_id),
  key k_solicitacao_lista_item_2 (solicitacao_id),
  constraint fk_solicitacao_lista_item_1 foreign key (solicitacao_lista_id) references solicitacao_lista (solicitacao_lista_id),
  constraint fk_solicitacao_lista_item_2 foreign key (solicitacao_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_origem (
  solicitacao_origem_id int(11) not null auto_increment,
  descricao varchar(100) not null default '',
  primary key (solicitacao_origem_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_origem_empresa (
  solicitacao_origem_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (solicitacao_origem_id,empresa_id),
  key k_solicitacao_origem_empresa_1 (solicitacao_origem_id),
  key k_solicitacao_origem_empresa_2 (empresa_id),
  constraint fk_solicitacao_origem_empresa_1 foreign key (solicitacao_origem_id) references solicitacao_origem (solicitacao_origem_id),
  constraint fk_solicitacao_origem_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_recorrente (
  solicitacao_recorrente_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  descricao varchar(500) not null default '',
  departamento_id int(11) not null default '0',
  servico_id int(11) not null default '0',
  solicitacao_categoria_id int(11) not null default '0',
  frequencia int(1) not null default '0',
  primary key (solicitacao_recorrente_id),
  key k_solicitacao_recorrente_1 (empresa_id),
  key k_solicitacao_recorrente_2 (departamento_id),
  key k_solicitacao_recorrente_3 (servico_id),
  key k_solicitacao_recorrente_4 (solicitacao_categoria_id),
  constraint fk_solicitacao_recorrente_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_solicitacao_recorrente_2 foreign key (departamento_id) references departamento (departamento_id),
  constraint fk_solicitacao_recorrente_3 foreign key (servico_id) references produto (produto_id),
  constraint fk_solicitacao_recorrente_4 foreign key (solicitacao_categoria_id) references solicitacao_categoria (solicitacao_categoria_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_recorrente_cliente (
  solicitacao_recorrente_id int(11) not null default '0',
  cliente_id int(11) not null default '0',
  primary key (solicitacao_recorrente_id,cliente_id),
  key k_solicitacao_recorrente_cliente_1 (solicitacao_recorrente_id),
  key k_solicitacao_recorrente_cliente_2 (cliente_id),
  constraint fk_solicitacao_recorrente_cliente_1 foreign key (solicitacao_recorrente_id) references solicitacao_recorrente (solicitacao_recorrente_id),
  constraint fk_solicitacao_recorrente_cliente_2 foreign key (cliente_id) references pessoa (pessoa_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_recorrente_cobranca (
  solicitacao_recorrente_cobranca_id int(11) not null auto_increment,
  solicitacao_recorrente_id int(11) not null default '0',
  nome varchar(100) not null default '',
  inicio int(2) not null default '0',
  fim int(2) not null default '0',
  primary key (solicitacao_recorrente_cobranca_id),
  unique key uk_solicitacao_recorrente_cobranca_1 (solicitacao_recorrente_id,nome),
  key k_solicitacao_recorrente_cobranca_1 (solicitacao_recorrente_id),
  constraint fk_solicitacao_recorrente_cobranca_1 foreign key (solicitacao_recorrente_id) references solicitacao_recorrente (solicitacao_recorrente_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_recorrente_documento (
  solicitacao_recorrente_id int(11) not null default '0',
  documento_id int(11) not null default '0',
  vencimento int(2) not null default '0',
  entrega int(2) not null default '0',
  competencia int(2) not null default '0',
  multa tinyint(1) not null default '0',
  primary key (solicitacao_recorrente_id,documento_id),
  key k_solicitacao_recorrente_documento_1 (solicitacao_recorrente_id),
  key k_solicitacao_recorrente_documento_2 (documento_id),
  constraint fk_solicitacao_recorrente_documento_1 foreign key (solicitacao_recorrente_id) references solicitacao_recorrente (solicitacao_recorrente_id),
  constraint fk_solicitacao_recorrente_documento_2 foreign key (documento_id) references documento (documento_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_referente (
  solicitacao_id int(11) not null default '0',
  solicitacao_referente_id int(11) not null default '0',
  primary key (solicitacao_id,solicitacao_referente_id),
  key k_solicitacao_referente_1 (solicitacao_id),
  key k_solicitacao_referente_2 (solicitacao_referente_id),
  constraint fk_solicitacao_referente_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id),
  constraint fk_solicitacao_referente_2 foreign key (solicitacao_referente_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_sla_atividade (
  solicitacao_sla_atividade_id int(11) not null auto_increment,
  solicitacao_id int(11) not null default '0',
  nivel int(1) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  atividade int(2) not null default '0',
  data_hora_vencimento_sla datetime not null default '0001-01-01 00:00:00',
  data_hora_vencimento_slo datetime not null default '0001-01-01 00:00:00',
  primary key (solicitacao_sla_atividade_id),
  key k_solicitacao_sla_atividade_1 (solicitacao_id),
  constraint fk_solicitacao_sla_atividade_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_tarefa (
  solicitacao_id int(11) not null default '0',
  tarefa_id int(11) not null default '0',
  primary key (solicitacao_id,tarefa_id),
  key k_solicitacao_tarefa_1 (solicitacao_id),
  key k_solicitacao_tarefa_2 (tarefa_id),
  constraint fk_solicitacao_tarefa_1 foreign key (solicitacao_id) references solicitacao (solicitacao_id),
  constraint fk_solicitacao_tarefa_2 foreign key (tarefa_id) references tarefa (tarefa_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_tipo (
  solicitacao_tipo_id int(11) not null auto_increment,
  descricao varchar(100) not null default '',
  classificacao int(1) not null default '0',
  sla tinyint(1) not null default '0',
  primary key (solicitacao_tipo_id)
) engine=innodb default charset=latin1;

create table if not exists solicitacao_tipo_empresa (
  solicitacao_tipo_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  ativo tinyint(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (solicitacao_tipo_id,empresa_id),
  key k_solicitacao_tipo_empresa_1 (solicitacao_tipo_id),
  key k_solicitacao_tipo_empresa_2 (empresa_id),
  constraint fk_solicitacao_tipo_empresa_1 foreign key (solicitacao_tipo_id) references solicitacao_tipo (solicitacao_tipo_id),
  constraint fk_solicitacao_tipo_empresa_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists sommusdash_usuario (
  usuario_id int(11) not null default '0',
  nome varchar(50) not null default '',
  senha varchar(32) not null default '',
  departamento varchar(50) not null default '',
  email varchar(100) not null default '',
  primary key (usuario_id),
  unique key uk_sommusdash_usuario_1 (email)
) engine=innodb default charset=latin1;

create table if not exists sped_credito_pis_cofins (
  sped_credito_pis_cofins_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  mes_origem char(6) not null default '',
  mes_utilizado char(6) not null default '',
  codigo_credito int(3) not null default '0',
  valor_credito_pis decimal(15,2) not null default '0.00',
  valor_credito_cofins decimal(15,2) not null default '0.00',
  valor_restante_pis decimal(15,2) not null default '0.00',
  valor_restante_cofins decimal(15,2) not null default '0.00',
  primary key (sped_credito_pis_cofins_id),
  unique key uk_sped_credito_pis_cofins_1 (empresa_id,mes_origem,mes_utilizado,codigo_credito),
  key k_sped_credito_pis_cofins_1 (empresa_id),
  constraint fk_sped_credito_pis_cofins_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists tag (
  tag_id int(11) not null auto_increment,
  nome varchar(50) not null default '',
  primary key (tag_id)
) engine=innodb default charset=latin1;

create table if not exists tarefa (
  tarefa_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  usuario_id int(11) not null default '0',
  descricao varchar(300) not null default '',
  data_hora_inicio datetime not null default '0001-01-01 00:00:00',
  data_hora_fim datetime not null default '0001-01-01 00:00:00',
  data_hora_previsao datetime not null default '0001-01-01 00:00:00',
  status int(1) not null default '0',
  percentual_concluido decimal(8,4) not null default '0.0000',
  origem int(1) not null default '0',
  excluido tinyint(1) not null default '0',
  primary key (tarefa_id),
  key k_tarefa_1 (empresa_id),
  key k_tarefa_2 (usuario_id),
  constraint fk_tarefa_1 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists tarefa_tempo (
  tarefa_tempo_id int(11) not null auto_increment,
  tarefa_id int(11) not null default '0',
  data_hora_sistema_inicio datetime not null default '0001-01-01 00:00:00',
  data_hora_sistema_fim datetime not null default '0001-01-01 00:00:00',
  data_hora_usuario_inicio datetime not null default '0001-01-01 00:00:00',
  data_hora_usuario_fim datetime not null default '0001-01-01 00:00:00',
  primary key (tarefa_tempo_id),
  key k_tarefa_tempo_1 (tarefa_id),
  constraint fk_tarefa_tempo_1 foreign key (tarefa_id) references tarefa (tarefa_id)
) engine=innodb default charset=latin1;

create table if not exists veiculo (
  veiculo_id int(11) not null auto_increment,
  placa varchar(7) not null default '',
  descricao varchar(50) not null default '',
  marca varchar(30) not null default '',
  modelo varchar(30) not null default '',
  cor varchar(30) not null default '',
  ano_fabricacao int(4) not null default '0',
  ano_modelo int(4) not null default '0',
  combustivel int(1) not null default '0',
  renavam varchar(15) not null default '',
  primary key (veiculo_id),
  unique key uk_veiculo_1 (placa)
) engine=innodb default charset=latin1;

create table if not exists venda (
  venda_id int(11) not null auto_increment,
  empresa_id int(11) not null default '0',
  data_hora datetime not null default '0001-01-01 00:00:00',
  operacao_id int(11) not null default '0',
  cliente_id int(11) default null,
  plano_pagamento_id int(11) not null default '0',
  pagamento int(1) not null default '0',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto_item decimal(15,2) not null default '0.00',
  valor_desconto_subtotal decimal(15,2) not null default '0.00',
  valor_acrescimo_item decimal(15,2) not null default '0.00',
  valor_acrescimo_subtotal decimal(15,2) not null default '0.00',
  percentual_desconto_subtotal decimal(8,4) not null default '0.0000',
  percentual_acrescimo_subtotal decimal(8,4) not null default '0.0000',
  veiculo_id int(11) default null,
  km_veiculo decimal(15,2) not null default '0.00',
  comprador varchar(50) not null default '',
  usuario_id int(11) not null default '0',
  vendedor_id int(11) default null,
  estoque_id int(11) default null,
  validade date not null default '0000-00-00',
  status int(2) not null default '0',
  cancelada tinyint(1) not null default '0',
  devolvida tinyint(1) not null default '0',
  ordem_servico_id int(11) default null,
  nfe_id int(11) default null,
  nfce_id int(11) default null,
  nfse_id int(11) default null,
  cfe_sat_id int(11) default null,
  cfe_mfe_id int(11) default null,
  pdv_id int(11) default null,
  atualizado datetime not null default '0001-01-01 00:00:00',
  primary key (venda_id),
  key k_venda_1 (empresa_id),
  key k_venda_2 (operacao_id),
  key k_venda_3 (cliente_id),
  key k_venda_4 (plano_pagamento_id),
  key k_venda_5 (veiculo_id),
  key k_venda_6 (usuario_id),
  key k_venda_7 (vendedor_id),
  key k_venda_8 (estoque_id),
  key k_venda_9 (ordem_servico_id),
  key k_venda_10 (nfe_id),
  key k_venda_11 (nfce_id),
  key k_venda_12 (nfse_id),
  key k_venda_13 (cfe_sat_id),
  key k_venda_14 (cfe_mfe_id),
  key k_venda_15 (pdv_id),
  constraint fk_venda_1 foreign key (empresa_id) references empresa (empresa_id),
  constraint fk_venda_10 foreign key (nfe_id) references nfe (nfe_id),
  constraint fk_venda_11 foreign key (nfce_id) references nfce (nfce_id),
  constraint fk_venda_12 foreign key (nfse_id) references nfse (nfse_id),
  constraint fk_venda_13 foreign key (cfe_sat_id) references cfe_sat (cfe_sat_id),
  constraint fk_venda_14 foreign key (cfe_mfe_id) references cfe_mfe (cfe_mfe_id),
  constraint fk_venda_15 foreign key (pdv_id) references pdv (pdv_id),
  constraint fk_venda_2 foreign key (operacao_id) references operacao (operacao_id),
  constraint fk_venda_3 foreign key (cliente_id) references pessoa (pessoa_id),
  constraint fk_venda_4 foreign key (plano_pagamento_id) references plano_pagamento (plano_pagamento_id),
  constraint fk_venda_5 foreign key (veiculo_id) references veiculo (veiculo_id),
  constraint fk_venda_7 foreign key (vendedor_id) references pessoa (pessoa_id),
  constraint fk_venda_8 foreign key (estoque_id) references estoque (estoque_id),
  constraint fk_venda_9 foreign key (ordem_servico_id) references ordem_servico (ordem_servico_id)
) engine=innodb default charset=latin1;

create table if not exists venda_item (
  venda_item_id int(11) not null auto_increment,
  venda_id int(11) not null default '0',
  produto_id int(11) not null default '0',
  produto_grade_id int(11) default null,
  produto_lote_id int(11) default null,
  descricao text not null,
  numero_item int(11) not null default '0',
  quantidade decimal(15,4) not null default '0.0000',
  preco_custo_bruto decimal(15,4) not null default '0.0000',
  preco_venda_bruto decimal(15,4) not null default '0.0000',
  valor_total_bruto decimal(15,2) not null default '0.00',
  valor_total_liquido decimal(15,2) not null default '0.00',
  valor_desconto_item decimal(15,2) not null default '0.00',
  valor_desconto_subtotal decimal(15,2) not null default '0.00',
  valor_acrescimo_item decimal(15,2) not null default '0.00',
  valor_acrescimo_subtotal decimal(15,2) not null default '0.00',
  usuario_id int(11) not null default '0',
  vendedor_id int(11) default null,
  tecnico_id int(11) default null,
  cancelada tinyint(1) not null default '0',
  nfe_item_id int(11) default null,
  nfce_item_id int(11) default null,
  nfse_item_id int(11) default null,
  cfe_sat_item_id int(11) default null,
  cfe_mfe_item_id int(11) default null,
  primary key (venda_item_id),
  key k_venda_item_1 (venda_id),
  key k_venda_item_2 (produto_id),
  key k_venda_item_3 (produto_grade_id),
  key k_venda_item_4 (produto_lote_id),
  key k_venda_item_5 (usuario_id),
  key k_venda_item_6 (vendedor_id),
  key k_venda_item_7 (tecnico_id),
  key k_venda_item_8 (nfe_item_id),
  key k_venda_item_9 (nfce_item_id),
  key k_venda_item_10 (nfse_item_id),
  key k_venda_item_11 (cfe_sat_item_id),
  key k_venda_item_12 (cfe_mfe_item_id),
  constraint fk_venda_item_1 foreign key (venda_id) references venda (venda_id),
  constraint fk_venda_item_10 foreign key (nfse_item_id) references nfse_item (nfse_item_id),
  constraint fk_venda_item_11 foreign key (cfe_sat_item_id) references cfe_sat_item (cfe_sat_item_id),
  constraint fk_venda_item_12 foreign key (cfe_mfe_item_id) references cfe_mfe_item (cfe_mfe_item_id),
  constraint fk_venda_item_2 foreign key (produto_id) references produto (produto_id),
  constraint fk_venda_item_3 foreign key (produto_grade_id) references produto_grade (produto_grade_id),
  constraint fk_venda_item_4 foreign key (produto_lote_id) references produto_lote (produto_lote_id),
  constraint fk_venda_item_6 foreign key (vendedor_id) references pessoa (pessoa_id),
  constraint fk_venda_item_7 foreign key (tecnico_id) references pessoa (pessoa_id),
  constraint fk_venda_item_8 foreign key (nfe_item_id) references nfe_item (nfe_item_id),
  constraint fk_venda_item_9 foreign key (nfce_item_id) references nfce_item (nfce_item_id)
) engine=innodb default charset=latin1;

create table if not exists vendedor_meta (
  vendedor_meta_id int(11) not null auto_increment,
  vendedor_id int(11) not null default '0',
  empresa_id int(11) not null default '0',
  mes char(6) not null default '',
  valor decimal(15,2) not null default '0.00',
  primary key (vendedor_meta_id),
  unique key uk_vendedor_meta_1 (vendedor_id,empresa_id,mes),
  key k_vendedor_meta_1 (vendedor_id),
  key k_vendedor_meta_2 (empresa_id),
  constraint fk_vendedor_meta_1 foreign key (vendedor_id) references pessoa (pessoa_id),
  constraint fk_vendedor_meta_2 foreign key (empresa_id) references empresa (empresa_id)
) engine=innodb default charset=latin1;

create table if not exists versao (
  versao_id int(11) not null auto_increment,
  tipo int(1) not null default '0',
  versao varchar(100) not null default '',
  data_hora datetime not null default '0001-01-01 00:00:00',
  hash varchar(32) not null default '',
  primary key (versao_id),
  unique key uk_versao_1 (tipo,versao),
  key k_versao_1 (versao)
) engine=innodb default charset=latin1;

insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (1, 1, "1", 1, "", "ATIVO", 2, 1, "S", 1);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (2, 2, "1.1", 2, "", "CIRCULANTE", 2, 1, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (3, 3, "1.1.1", 3, "", "DISPONIVEL", 2, 1, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (4, 4, "1.1.1.001", 4, "", "Contas correntes", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (5, 5, "1.1.2", 5, "", "CONTAS A RECEBER", 2, 1, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (6, 6, "1.1.2.001", 6, "", "Clientes", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (7, 7, "1.1.2.002", 7, "", "Outras contas a receber", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (8, 8, "1.1.3", 8, "", "ESTOQUE", 2, 1, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (9, 9, "1.1.3.001", 9, "", "Estoque de produtos", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (10, 10, "1.2", 10, "", "NÃO CIRCULANTE", 2, 1, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (11, 11, "1.2.1", 11, "", "INVESTIMENTOS", 2, 1, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (12, 12, "1.2.1.001", 12, "", "Rentáveis", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (13, 13, "1.2.1.002", 13, "", "Imobilizado", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (14, 14, "1.2.1.003", 14, "", "Intangível", 2, 1, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (15, 15, "2", 15, "", "PASSIVO", 1, 2, "S", 1);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (16, 16, "2.1", 16, "", "CIRCULANTE", 1, 2, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (17, 17, "2.1.1", 17, "", "CONTAS A PAGAR", 1, 2, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (18, 18, "2.1.1.001", 18, "", "Fornecedores", 1, 2, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (19, 19, "2.1.1.002", 19, "", "Empréstimos", 1, 2, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (20, 20, "2.1.1.003", 20, "", "(-) Juros de empréstimos", 2, 2, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (21, 21, "2.1.1.004", 21, "", "Outras contas a pagar", 1, 2, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (22, 22, "3", 22, "", "PATRIMÔNIO LÍQUIDO", 1, 3, "S", 1);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (23, 23, "3.1", 23, "", "CAPITAL", 1, 3, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (24, 24, "3.1.1", 24, "", "CAPITAL SOCIAL", 1, 3, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (25, 25, "3.1.1.001", 25, "", "Capital integralizado", 1, 3, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (26, 26, "3.1.1.002", 26, "", "Integralização de capital de outras empresas", 1, 3, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (27, 27, "3.1.1.003", 27, "", "(-) Desintegralização de capital para outras empresas", 2, 3, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (28, 28, "3.1.2", 28, "", "LUCROS E PREJUÍZOS", 1, 3, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (29, 29, "3.1.2.001", 29, "", "Lucros e prejuizos acumulados", 1, 3, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (30, 30, "3.1.2.002", 30, "", "Terceiros", 1, 3, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (31, 31, "4", 31, "", "RECEITAS", 1, 4, "S", 1);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (32, 32, "4.1", 32, "", "RECEITAS OPERACIONAIS", 1, 4, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (33, 33, "4.1.1", 33, "", "RECEITAS COM VENDAS", 1, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (34, 34, "4.1.1.001", 34, "", "Receitas com vendas de produtos", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (35, 35, "4.1.1.002", 35, "", "Receitas com vendas de serviços", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (36, 36, "4.1.1.003", 36, "", "Receitas com recebimentos de vendas de produtos", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (37, 37, "4.1.1.004", 37, "", "Receitas com recebimentos de vendas de serviços", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (38, 38, "4.1.1.005", 38, "", "(-) Devoluções de vendas de produtos", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (39, 39, "4.1.1.006", 39, "", "(-) Devoluções de vendas de serviços", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (40, 40, "4.1.2", 40, "", "RECEITAS COM RECORRÊNCIAS", 1, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (41, 41, "4.1.2.001", 41, "", "Receitas com recorrências de serviços", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (42, 42, "4.1.2.002", 42, "", "Receitas com recebimentos de recorrências", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (43, 43, "4.2", 43, "", "RECEITAS NÃO OPERACIONAIS", 1, 4, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (44, 44, "4.2.1", 44, "", "RECEITAS DIVERSAS", 1, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (45, 45, "4.2.1.001", 45, "", "Receitas com integralização de capital", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (46, 46, "4.2.1.002", 46, "", "Receitas com vendas de imobilizados", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (47, 47, "4.2.1.003", 47, "", "Receitas com investimentos", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (48, 48, "4.2.1.004", 48, "", "Receitas com reembolsos", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (49, 49, "4.2.1.005", 49, "", "Receitas com descontos recebidos", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (50, 50, "4.2.1.006", 50, "", "Receitas com acréscimos recebidos", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (51, 51, "4.2.1.007", 51, "", "Receitas de terceiros", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (52, 52, "4.2.1.008", 52, "", "Outras receitas", 1, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (53, 53, "5", 53, "", "CUSTOS E DESPESAS", 2, 4, "S", 1);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (54, 54, "5.1", 54, "", "CUSTOS", 2, 4, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (55, 55, "5.1.1", 55, "", "CUSTOS DE VENDAS", 2, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (56, 56, "5.1.1.001", 56, "", "Custos de vendas de produtos (CMV)", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (57, 57, "5.1.2", 57, "", "CUSTOS DE INVESTIMENTOS", 2, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (58, 58, "5.1.2.001", 58, "", "Custos com investimentos rentáveis", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (59, 59, "5.1.2.002", 59, "", "Custos com investimentos imobilizado", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (60, 60, "5.1.2.003", 60, "", "Custos com investimentos intangíveis", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (61, 61, "5.2", 61, "", "DESPESAS", 2, 4, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (62, 62, "5.2.1", 62, "", "DESPESAS OPERACIONAIS", 2, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (63, 63, "5.2.1.001", 63, "", "Despesas administrativas", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (64, 64, "5.2.1.002", 64, "", "Despesas comerciais", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (65, 65, "5.2.1.003", 65, "", "Despesas financeiras", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (66, 66, "5.2.1.004", 66, "", "Despesas tributárias", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (67, 67, "5.2.1.005", 67, "", "Despesas com marketing", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (68, 68, "5.2.1.006", 68, "", "Despesas com colaboradores", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (69, 69, "5.2.1.007", 69, "", "Despesas com sócios", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (70, 70, "5.2.2", 70, "", "DESPESAS NÃO OPERACIONAIS", 2, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (71, 71, "5.2.2.001", 71, "", "Despesas com descontos concedidos", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (72, 72, "5.2.2.002", 72, "", "Despesas com acréscimos pagos", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (73, 73, "5.2.2.003", 73, "", "Despesas de terceiros", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (74, 74, "5.2.2.004", 74, "", "Outras despesas", 2, 4, "A", 4);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (75, 75, "6", 75, "", "RESULTADO", 1, 4, "S", 1);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (76, 76, "6.1", 76, "", "APURAÇÃO", 1, 4, "S", 2);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (77, 77, "6.1.1", 77, "", "APURAÇÃO DE RESULTADO", 1, 4, "S", 3);
insert into conta_contabil (conta_contabil_id, codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (78, 78, "6.1.1.001", 78, "", "Resultado do exercício", 1, 4, "A", 4);

insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (1, 1, "1.1.01", "Venda de produto a vista", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (2, 2, "1.1.01", "Venda de produto a prazo", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (3, 3, "1.1.01", "Venda de serviço a vista", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (4, 4, "1.1.01", "Venda de serviço a prazo", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (5, 5, "1.1.01", "Recebimento de venda de produto", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (6, 6, "1.1.01", "Recebimento de venda de serviço", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (7, 7, "1.1.01", "Devolução de venda de produto a vista", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (8, 8, "1.1.01", "Devolução de venda de produto a prazo", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (9, 9, "1.1.01", "Devolução de venda de serviço a vista", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (10, 10, "1.1.01", "Devolução de venda de serviço a prazo", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (11, 11, "1.1.02", "Recorrência de serviços", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (12, 12, "1.1.02", "Recebimento de recorrência de serviços", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (13, 13, "1.2.01", "Receitas com integralização de capital", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (14, 14, "1.2.02", "Receitas com vendas de imobilizados", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (15, 15, "1.2.03", "Receitas com investimentos", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (16, 16, "1.2.04", "Receitas com reembolsos", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (17, 17, "1.2.05", "Outras receitas", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (18, 18, "2.1.01", "Compra de produto a vista", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (19, 19, "2.1.01", "Compra de produto a prazo", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (20, 20, "2.1.01", "Pagamento de compra de produto", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (21, 21, "2.1.01", "Devolução de compra de produto a vista", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (22, 22, "2.1.01", "Devolução de compra de produto a prazo", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (23, 23, "3.1.01", "Despesas administrativas", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (24, 24, "3.1.02", "Despesas comerciais", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (25, 25, "3.1.03", "Despesas financeiras", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (26, 26, "3.1.04", "Despesas tributárias", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (27, 27, "3.1.05", "Despesas com marketing", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (28, 28, "3.1.06", "Pagamentos de colaboradores", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (29, 29, "3.1.06", "Descontos de colaboradores", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (30, 30, "3.1.07", "Despesas com sócios", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (31, 31, "3.1.08", "Outras despesas", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (32, 32, "4.1.01", "Investimentos rentáveis", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (33, 33, "4.1.02", "Investimentos em imobilizados", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (34, 34, "4.1.03", "Investimentos em intangíveis", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (35, 35, "5.1.01", "Tomadas de empréstimos", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (36, 36, "5.1.02", "Pagamentos de empréstimos", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (37, 37, "5.1.03", "Pagamentos de juros de empréstimos", "D");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (38, 38, "6.1.01", "Créditos de terceiros", "C");
insert into categoria_grupo (categoria_grupo_id, codigo_interno, codigo, nome, credito_debito) values (39, 39, "6.1.02", "Débitos de terceiros", "D");

insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 4, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 9, 1, 2, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 29, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 34, 1, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 34, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 56, 1, 1, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 78, 1, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (1, 78, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (2, 6, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (2, 9, 2, 2, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (2, 29, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (2, 34, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (2, 56, 2, 1, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (2, 78, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (3, 4, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (3, 29, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (3, 35, 1, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (3, 35, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (3, 78, 1, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (3, 78, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (4, 6, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (4, 29, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (4, 35, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (4, 78, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 6, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 36, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (5, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 6, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 37, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (6, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 4, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 9, 5, 1, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 29, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 38, 5, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 38, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 56, 5, 2, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 78, 5, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (7, 78, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (8, 6, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (8, 9, 6, 1, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (8, 29, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (8, 38, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (8, 56, 6, 2, 2, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (8, 78, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (9, 4, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (9, 29, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (9, 39, 5, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (9, 39, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (9, 78, 5, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (9, 78, 5, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (10, 6, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (10, 29, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (10, 39, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (10, 78, 6, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (11, 6, 15, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (11, 29, 15, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (11, 41, 15, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (11, 78, 15, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 6, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 41, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (12, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 4, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 7, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 7, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 25, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 25, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 45, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 45, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 45, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 45, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 78, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 78, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (13, 78, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 4, 1, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 7, 2, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 7, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 13, 1, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 13, 2, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 46, 1, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 46, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 78, 1, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (14, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 4, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 7, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 7, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 12, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 12, 12, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 47, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 47, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (15, 78, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 4, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 7, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 7, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 29, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 29, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 48, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 48, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 48, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 48, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 78, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 78, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (16, 78, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 4, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 7, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 7, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 29, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 29, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 52, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 52, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 52, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 52, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 78, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 78, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (17, 78, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (18, 4, 3, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (18, 9, 3, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (18, 56, 3, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (18, 78, 3, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (19, 9, 4, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (19, 18, 4, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 18, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 56, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (20, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (21, 4, 7, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (21, 9, 7, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (21, 56, 7, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (21, 78, 7, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (22, 9, 8, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (22, 18, 8, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 63, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 63, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 63, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 63, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (23, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 64, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 64, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 64, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 64, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (24, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 65, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 65, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 65, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 65, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (25, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 66, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 66, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 66, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 66, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (26, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 67, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 67, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 67, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 67, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (27, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (28, 4, 14, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (28, 29, 14, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (28, 68, 14, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (28, 68, 14, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (28, 78, 14, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (28, 78, 14, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (29, 4, 14, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (29, 29, 14, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (29, 68, 14, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (29, 68, 14, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (29, 78, 14, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (29, 78, 14, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 69, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 69, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 69, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 69, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (30, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 29, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 29, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 74, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 74, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 74, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 74, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (31, 78, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 12, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 12, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 21, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 58, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 58, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (32, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 4, 3, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 13, 3, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 13, 4, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 21, 4, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 59, 3, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 59, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 78, 3, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (33, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 14, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 14, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 21, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 60, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 60, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (34, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 4, 16, 1, 3, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 19, 16, 1, 4, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 20, 16, 2, 6, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 29, 16, 2, 5, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 65, 16, 1, 5, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 65, 16, 1, 5, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 78, 16, 2, 5, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (35, 78, 16, 2, 5, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 4, 10, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 19, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 78, 10, 2, 10, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (36, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 4, 10, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 19, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 20, 10, 1, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 29, 10, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 65, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 65, 10, 1, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 78, 10, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (37, 78, 10, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 4, 9, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 4, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 7, 9, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 7, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 29, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 30, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 30, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 50, 9, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 50, 9, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 51, 9, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 51, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 51, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 51, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 71, 9, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 71, 9, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 78, 9, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 78, 9, 1, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 78, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 78, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (38, 78, 12, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 4, 10, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 4, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 21, 10, 2, 7, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 21, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 29, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 30, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 30, 13, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 49, 10, 1, 8, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 49, 10, 1, 8, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 72, 10, 1, 9, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 72, 10, 1, 9, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 73, 10, 1, 7, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 73, 11, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 73, 11, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 73, 13, 1, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 78, 10, 1, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 78, 10, 2, 10, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 78, 11, 2, 1, 1);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 78, 11, 2, 1, 2);
insert into categoria_grupo_conta_contabil (categoria_grupo_id, conta_contabil_id, origem, saldo, valor, regime) values (39, 78, 13, 2, 1, 2);

insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (90, 1, "1", "RECEITAS", null, "", "S", 1);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (91, 2, "1.1", "RECEITAS OPERACIONAIS", null, "", "S", 2);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (92, 3, "1.1.01", "RECEITAS COM VENDAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (93, 4, "1.1.01.001", "Vendas de produtos a vista", 1, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (94, 5, "1.1.01.002", "Vendas de produtos a prazo", 2, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (95, 6, "1.1.01.003", "Vendas de serviços a vista", 3, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (96, 7, "1.1.01.004", "Vendas de serviços a prazo", 4, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (97, 8, "1.1.01.005", "Recebimentos de vendas de produtos", 5, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (98, 9, "1.1.01.006", "Recebimentos de vendas de serviços ", 6, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (99, 10, "1.1.01.007", "(-) Devoluções de vendas de produtos a vista", 7, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (100, 11, "1.1.01.008", "(-) Devoluções de vendas de produtos a prazo", 8, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (101, 12, "1.1.01.009", "(-) Devoluções de vendas de serviços a vista", 9, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (102, 13, "1.1.01.010", "(-) Devoluções de vendas de serviços a prazo", 10, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (103, 14, "1.1.02", "RECEITAS COM RECORRÊNCIAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (104, 15, "1.1.02.001", "Recorrência de serviços", 11, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (105, 16, "1.1.02.002", "Recebimento de recorrência de serviços", 12, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (106, 17, "1.2", "RECEITAS NÃO OPERACIONAIS", null, "", "S", 2);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (107, 18, "1.2.01", "RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (108, 19, "1.2.02", "RECEITAS COM VENDAS DE IMOBILIZADOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (109, 20, "1.2.02.001", "Venda de veículos", 14, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (110, 21, "1.2.02.002", "Venda de máquinas", 14, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (111, 22, "1.2.02.003", "Venda de equipamentos", 14, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (112, 23, "1.2.02.004", "Venda de móveis", 14, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (113, 24, "1.2.02.005", "Venda de imóveis", 14, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (114, 25, "1.2.03", "RECEITAS COM INVESTIMENTOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (115, 26, "1.2.04", "RECEITAS COM REEMBOLSOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (116, 27, "1.2.05", "OUTRAS RECEITAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (117, 28, "2", "CUSTOS", null, "", "S", 1);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (118, 29, "2.1.01", "CUSTOS COM FORNECEDORES", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (119, 30, "2.1.01.001", "Compras de produtos a vista", 18, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (120, 31, "2.1.01.002", "Compras de produtos a prazo", 19, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (121, 32, "2.1.01.003", "Pagamentos de compras de produtos", 20, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (122, 33, "2.1.01.004", "(-) Devoluções de compras de produtos a vista", 21, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (123, 34, "2.1.01.005", "(-) Devoluções de compras de produtos a prazo", 22, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (124, 35, "3", "DESPESAS", null, "", "S", 1);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (125, 36, "3.1.01", "DESPESAS ADMINISTRATIVAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (126, 37, "3.1.01.001", "Água e esgoto", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (127, 38, "3.1.01.002", "Aluguel de imóvel", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (128, 39, "3.1.01.003", "Assistência técnica", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (129, 40, "3.1.01.004", "Associações de classe", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (130, 41, "3.1.01.005", "Cartório", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (131, 42, "3.1.01.006", "Condomínio", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (132, 43, "3.1.01.007", "Confraternizações ", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (133, 44, "3.1.01.008", "Consultoria administrativa", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (134, 45, "3.1.01.009", "Contabilidade ", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (135, 46, "3.1.01.010", "Correios", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (136, 47, "3.1.01.011", "Despesas com viagens", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (137, 48, "3.1.01.012", "Doações", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (138, 49, "3.1.01.013", "Documentação de veiculos", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (139, 50, "3.1.01.014", "Domínios da internet", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (140, 51, "3.1.01.015", "Energia elétrica", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (141, 52, "3.1.01.016", "Fretes e carretos", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (142, 53, "3.1.01.017", "Licença para uso de software", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (143, 54, "3.1.01.018", "Manutenção de veículos", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (144, 55, "3.1.01.019", "Manutenção predial", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (145, 56, "3.1.01.020", "Materiais para consumo", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (146, 57, "3.1.01.021", "Materiais de escritório", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (147, 58, "3.1.01.022", "Materiais de limpeza", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (148, 59, "3.1.01.023", "Multas de trânsito", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (149, 60, "3.1.01.024", "Provedor de internet", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (150, 61, "3.1.01.025", "Seguros de veiculos ", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (151, 62, "3.1.01.026", "Seguros diversos ", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (152, 63, "3.1.01.027", "Supermercado", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (153, 64, "3.1.01.028", "Telefonia", 23, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (154, 65, "3.1.02", "DESPESAS COMERCIAIS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (155, 66, "3.1.02.001", "Brindes ", 24, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (156, 67, "3.1.02.002", "Comissões", 24, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (157, 68, "3.1.02.003", "Feiras ", 24, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (158, 69, "3.1.02.004", "Premiações", 24, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (159, 70, "3.1.03", "DESPESAS FINANCEIRAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (160, 71, "3.1.03.001", "Impostos financeiros ", 25, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (161, 72, "3.1.03.002", "Pagamento de juros", 25, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (162, 73, "3.1.03.003", "Tarifas bancárias", 25, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (163, 74, "3.1.03.004", "Tarifas de cobrança", 25, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (164, 75, "3.1.04", "DESPESAS TRIBUTÁRIAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (165, 76, "3.1.04.001", "Impostos municipais", 26, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (166, 77, "3.1.04.002", "Impostos estaduais", 26, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (167, 78, "3.1.04.003", "Impostos federais", 26, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (168, 79, "3.1.05", "DESPESAS COM MARKETING", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (169, 80, "3.1.05.001", "Agência de marketing ", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (170, 81, "3.1.05.002", "Carro de som", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (171, 82, "3.1.05.003", "Impulsionamento ", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (172, 83, "3.1.05.004", "Jornais", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (173, 84, "3.1.05.005", "Materiais gráfico", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (174, 85, "3.1.05.006", "Patrocínios", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (175, 86, "3.1.05.007", "Rádio ", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (176, 87, "3.1.05.008", "Serviços diversos de marketing ", 27, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (177, 88, "3.1.06", "DESPESAS COM COLABORADORES", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (178, 89, "3.1.06.001", "13º salário", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (179, 90, "3.1.06.002", "Adiantamento de salário", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (180, 91, "3.1.06.003", "Adiantamento do 13º salário", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (181, 92, "3.1.06.004", "Adicional noturno, insalubridade e periculosidade", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (182, 93, "3.1.06.005", "Comissão", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (183, 94, "3.1.06.006", "Contribuição sindical", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (184, 95, "3.1.06.007", "Descanso semanal remunerado", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (185, 96, "3.1.06.008", "Férias", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (186, 97, "3.1.06.009", "FGTS", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (187, 98, "3.1.06.010", "Horas extras", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (188, 99, "3.1.06.011", "INSS", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (189, 100, "3.1.06.012", "IRRF", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (190, 101, "3.1.06.013", "Plano de saúde", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (191, 102, "3.1.06.014", "Salário", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (192, 103, "3.1.06.015", "Salário família", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (193, 104, "3.1.06.016", "Seguro", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (194, 105, "3.1.06.017", "Vale alimentação", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (195, 106, "3.1.06.018", "Vale transporte", 28, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (196, 107, "3.1.06.019", "(-) Desconto de contribuição sindical", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (197, 108, "3.1.06.020", "(-) Desconto de faltas", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (198, 109, "3.1.06.021", "(-) Desconto de INSS", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (199, 110, "3.1.06.022", "(-) Desconto de IRRF", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (200, 111, "3.1.06.023", "(-) Desconto de plano de saúde", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (201, 112, "3.1.06.024", "(-) Desconto de vale alimentação", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (202, 113, "3.1.06.025", "(-) Desconto de vale transporte", 29, "C", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (203, 114, "3.1.07", "DESPESAS COM SÓCIOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (204, 115, "3.1.08", "OUTRAS DESPESAS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (205, 116, "4", "INVESTIMENTOS", null, "", "S", 1);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (206, 117, "4.1.01", "INVESTIMENTOS RENTÁVEIS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (207, 118, "4.1.01.001", "Títulos", 32, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (208, 119, "4.1.01.002", "Ações", 32, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (209, 120, "4.1.02", "INVESTIMENTOS EM IMOBILIZADO", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (210, 121, "4.1.02.001", "Compra de veículos", 33, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (211, 122, "4.1.02.002", "Compra de máquinas", 33, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (212, 123, "4.1.02.003", "Compra de equipamentos", 33, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (213, 124, "4.1.02.004", "Compra de móveis", 33, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (214, 125, "4.1.02.005", "Compra de imóveis", 33, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (215, 126, "4.1.03", "INVESTIMENTOS EM INTANGÍVEIS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (216, 127, "4.1.03.001", "Registro de marcas e patentes", 34, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (217, 128, "4.1.03.002", "Pesquisa e desenvolvimento", 34, "D", "A", 4);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (218, 129, "5", "EMPRÉSTIMOS", null, "", "S", 1);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (219, 130, "5.1.01", "TOMADAS DE EMPRÉSTIMOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (220, 131, "5.1.02", "PAGAMENTOS DE EMPRESTIMOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (221, 132, "5.1.03", "PAGAMENTOS DE JUROS DE EMPRESTIMOS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (222, 133, "6", "TERCEIROS", null, "", "S", 1);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (223, 134, "6.1.01", "CRÉDITOS DE TERCEIROS", null, "", "S", 3);
insert into categoria (categoria_id, codigo_interno, codigo, nome, categoria_grupo_id, credito_debito, analitica_sintetica, nivel) values (224, 135, "6.1.02", "DÉBITOS DE TERCEIROS", null, "", "S", 3);

insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (1, 1, "Salário", "V", 191, 100.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (2, 2, "Adiantamento de salário", "D", 179, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (3, 3, "13º salário", "V", 178, 50.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (4, 4, "Adiantamento do 13º salário", "V", 180, 50.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (5, 5, "Férias", "V", 185, 100.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (6, 6, "1/3 sobre férias", "V", 185, 33.3333);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (7, 7, "Hora extra 50%", "V", 187, 150.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (8, 8, "Hora extra 100%", "V", 187, 200.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (9, 9, "Desconto de faltas", "D", 197, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (10, 10, "Comissão", "V", 182, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (11, 11, "Desconto de plano de saúde", "D", 200, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (12, 12, "Vale Alimentação", "V", 194, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (13, 13, "Descanso semanal remunerado", "V", 184, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (14, 14, "Adicional noturno, insalubridade e periculosidade", "V", 181, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (15, 15, "Salário família", "V", 192, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (16, 16, "Desconto de IRRF", "D", 199, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (17, 17, "Desconto de vale transporte", "D", 202, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (18, 18, "Desconto de INSS", "D", 198, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (19, 19, "Desconto de contribuição sindical", "D", 196, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (20, 20, "Desconto de vale alimentação", "D", 201, 0.0000);
insert into folha_pagamento_evento (folha_pagamento_evento_id, codigo_interno, nome, vencimento_desconto, categoria_id, percentual_salario) values (21, 21, "Vale transporte", "V", 195, 0.0000);

insert into forma_pagamento (forma_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, forma_pagamento_nfe, abre_gaveta, tef, saldo, atualizado) values (1, 1, "Dinheiro", 1, 1, 1, True, False, True, NOW());
insert into forma_pagamento (forma_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, forma_pagamento_nfe, abre_gaveta, tef, saldo, atualizado) values (2, 2, "Cheque", 1, 2, 2, True, False, True, NOW());
insert into forma_pagamento (forma_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, forma_pagamento_nfe, abre_gaveta, tef, saldo, atualizado) values (3, 3, "Cartão", 1, 3, 3, False, False, False, NOW());
insert into forma_pagamento (forma_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, forma_pagamento_nfe, abre_gaveta, tef, saldo, atualizado) values (4, 4, "Crédiário", 2, 4, 99, False, False, False, NOW());
insert into forma_pagamento (forma_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, forma_pagamento_nfe, abre_gaveta, tef, saldo, atualizado) values (5, 5, "Nota de crédito", 1, 5, 99, False, False, True, NOW());
insert into forma_pagamento (forma_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, forma_pagamento_nfe, abre_gaveta, tef, saldo, atualizado) values (6, 6, "PIX", 1, 6, 17, False, False, True, NOW());

insert into operacao (operacao_id, codigo_interno, nome, entrada_saida, movimenta_estoque, movimenta_financeiro, atualiza_precos) values (1, 1, "Venda", "S", True, True, True);
insert into operacao (operacao_id, codigo_interno, nome, entrada_saida, movimenta_estoque, movimenta_financeiro, atualiza_precos) values (2, 2, "Devolução de venda", "E", True, True, True);
insert into operacao (operacao_id, codigo_interno, nome, entrada_saida, movimenta_estoque, movimenta_financeiro, atualiza_precos) values (3, 3, "Compra", "E", True, True, True);
insert into operacao (operacao_id, codigo_interno, nome, entrada_saida, movimenta_estoque, movimenta_financeiro, atualiza_precos) values (4, 4, "Devolução de compra", "S", True, True, True);
insert into operacao (operacao_id, codigo_interno, nome, entrada_saida, movimenta_estoque, movimenta_financeiro, atualiza_precos) values (5, 5, "Prestação de serviços", "S", False, True, True);

insert into operacao_categoria (operacao_id, categoria_id, tipo) values (1, 93, 1);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (1, 94, 2);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (1, 97, 9);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (2, 99, 5);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (2, 100, 6);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (3, 119, 3);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (3, 120, 4);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (3, 121, 10);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (4, 122, 7);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (4, 123, 8);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (5, 98, 9);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (5, 95, 11);
insert into operacao_categoria (operacao_id, categoria_id, tipo) values (5, 96, 12);

insert into plano_pagamento (plano_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, parcelamento, vencimento, edita, atualizado) values (1, 1, "A Vista", 1, 1, 0, 0, False, NOW());
insert into plano_pagamento (plano_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, parcelamento, vencimento, edita, atualizado) values (2, 2, "A Prazo - 30 dias", 2, 4, 1, 0, False, NOW());
insert into plano_pagamento (plano_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, parcelamento, vencimento, edita, atualizado) values (3, 3, "A Prazo - 30/60 dias", 2, 4, 1, 0, False, NOW());
insert into plano_pagamento (plano_pagamento_id, codigo_interno, nome, pagamento, grupo_pagamento, parcelamento, vencimento, edita, atualizado) values (4, 4, "A Prazo - 30/60/90 dias", 2, 4, 1, 0, False, NOW());

insert into plano_pagamento_prazo (plano_pagamento_id, prazo) values (2, 30);
insert into plano_pagamento_prazo (plano_pagamento_id, prazo) values (3, 30);
insert into plano_pagamento_prazo (plano_pagamento_id, prazo) values (3, 60);
insert into plano_pagamento_prazo (plano_pagamento_id, prazo) values (4, 30);
insert into plano_pagamento_prazo (plano_pagamento_id, prazo) values (4, 60);
insert into plano_pagamento_prazo (plano_pagamento_id, prazo) values (4, 90);

insert into versao values (null, 2, '20221010.125555.282', '2022-10-18 18:47:34', '72e1c93f34bcab02d69014cdb6405113');

set foreign_key_checks=1;

-- hash_arquivo: e5e8a141e8fe7ce4b12fab7aaa5b5f1b