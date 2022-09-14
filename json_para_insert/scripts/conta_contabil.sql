insert into conta_contabil (codigo_interno, codigo, codigo_reduzido, codigo_rfb, nome, natureza, grupo, analitica_sintetica, nivel) values (1, "1", 1, "", "ATIVO", 2, 1, "S", 1), (2, "1.1", 2, "", "CIRCULANTE", 2, 1, "S", 2), (3, "1.1.1", 3, "", "DISPONIVEL", 2, 1, "S", 3), (4, "1.1.1.001", 4, "", "Contas correntes", 2, 1, "A", 4), (5, "1.1.2", 5, "", "CONTAS A RECEBER", 2, 1, "S", 3), (6, "1.1.2.001", 6, "", "Clientes", 2, 1, "A", 4), (7, "1.1.2.002", 7, "", "Outras contas a receber", 2, 1, "A", 4), (8, "1.1.3", 8, "", "ESTOQUE", 2, 1, "S", 3), (9, "1.1.3.001", 9, "", "Estoque de produtos", 2, 1, "A", 4), (10, "1.2", 10, "", "N�O CIRCULANTE", 2, 1, "S", 2), (11, "1.2.1", 11, "", "INVESTIMENTOS", 2, 1, "S", 3), (12, "1.2.1.001", 12, "", "Rent�veis", 2, 1, "A", 4), (13, "1.2.1.002", 13, "", "Imobilizado", 2, 1, "A", 4), (14, "1.2.1.003", 14, "", "Intang�vel", 2, 1, "A", 4), (15, "2", 15, "", "PASSIVO", 1, 2, "S", 1), (16, "2.1", 16, "", "CIRCULANTE", 1, 2, "S", 2), (17, "2.1.1", 17, "", "CONTAS A PAGAR", 1, 2, "S", 3), (18, "2.1.1.001", 18, "", "Fornecedores", 1, 2, "A", 4), (19, "2.1.1.002", 19, "", "Empr�stimos", 1, 2, "A", 4), (20, "2.1.1.003", 20, "", "(-) Juros de empr�stimos", 2, 2, "A", 4), (21, "2.1.1.004", 21, "", "Outras contas a pagar", 1, 2, "A", 4), (22, "3", 22, "", "PATRIM�NIO L�QUIDO", 1, 3, "S", 1), (23, "3.1", 23, "", "CAPITAL", 1, 3, "S", 2), (24, "3.1.1", 24, "", "CAPITAL SOCIAL", 1, 3, "S", 3), (25, "3.1.1.001", 25, "", "Capital integralizado", 1, 3, "A", 4), (26, "3.1.1.002", 26, "", "Integraliza��o de capital de outras empresas", 1, 3, "A", 4), (27, "3.1.1.003", 27, "", "(-) Desintegraliza��o de capital para outras empresas", 2, 3, "A", 4), (28, "3.1.2", 28, "", "LUCROS E PREJU�ZOS", 1, 3, "S", 3), (29, "3.1.2.001", 29, "", "Lucros e prejuizos acumulados", 1, 3, "A", 4), (30, "3.1.2.002", 30, "", "Terceiros", 1, 3, "A", 4), (31, "4", 31, "", "RECEITAS", 1, 4, "S", 1), (32, "4.1", 32, "", "RECEITAS OPERACIONAIS", 1, 4, "S", 2), (33, "4.1.1", 33, "", "RECEITAS COM VENDAS", 1, 4, "S", 3), (34, "4.1.1.001", 34, "", "Receitas com vendas de produtos", 1, 4, "A", 4), (35, "4.1.1.002", 35, "", "Receitas com vendas de servi�os", 1, 4, "A", 4), (36, "4.1.1.003", 36, "", "Receitas com recebimentos de vendas de produtos", 1, 4, "A", 4), (37, "4.1.1.004", 37, "", "Receitas com recebimentos de vendas de servi�os", 1, 4, "A", 4), (38, "4.1.1.005", 38, "", "(-) Devolu��es de vendas de produtos", 2, 4, "A", 4), (39, "4.1.1.006", 39, "", "(-) Devolu��es de vendas de servi�os", 2, 4, "A", 4), (40, "4.1.2", 40, "", "RECEITAS COM RECORR�NCIAS", 1, 4, "S", 3), (41, "4.1.2.001", 41, "", "Receitas com recorr�ncias de servi�os", 1, 4, "A", 4), (42, "4.1.2.002", 42, "", "Receitas com recebimentos de recorr�ncias", 1, 4, "A", 4), (43, "4.2", 43, "", "RECEITAS N�O OPERACIONAIS", 1, 4, "S", 2), (44, "4.2.1", 44, "", "RECEITAS DIVERSAS", 1, 4, "S", 3), (45, "4.2.1.001", 45, "", "Receitas com integraliza��o de capital", 1, 4, "A", 4), (46, "4.2.1.002", 46, "", "Receitas com vendas de imobilizados", 1, 4, "A", 4), (47, "4.2.1.003", 47, "", "Receitas com investimentos", 1, 4, "A", 4), (48, "4.2.1.004", 48, "", "Receitas com reembolsos", 1, 4, "A", 4), (49, "4.2.1.005", 49, "", "Receitas com descontos recebidos", 1, 4, "A", 4), (50, "4.2.1.006", 50, "", "Receitas com acr�scimos recebidos", 1, 4, "A", 4), (51, "4.2.1.007", 51, "", "Receitas de terceiros", 1, 4, "A", 4), (52, "4.2.1.008", 52, "", "Outras receitas", 1, 4, "A", 4), (53, "5", 53, "", "CUSTOS E DESPESAS", 2, 4, "S", 1), (54, "5.1", 54, "", "CUSTOS", 2, 4, "S", 2), (55, "5.1.1", 55, "", "CUSTOS DE VENDAS", 2, 4, "S", 3), (56, "5.1.1.001", 56, "", "Custos de vendas de produtos (CMV)", 2, 4, "A", 4), (57, "5.1.2", 57, "", "CUSTOS DE INVESTIMENTOS", 2, 4, "S", 3), (58, "5.1.2.001", 58, "", "Custos com investimentos rent�veis", 2, 4, "A", 4), (59, "5.1.2.002", 59, "", "Custos com investimentos imobilizado", 2, 4, "A", 4), (60, "5.1.2.003", 60, "", "Custos com investimentos intang�veis", 2, 4, "A", 4), (61, "5.2", 61, "", "DESPESAS", 2, 4, "S", 2), (62, "5.2.1", 62, "", "DESPESAS OPERACIONAIS", 2, 4, "S", 3), (63, "5.2.1.001", 63, "", "Despesas administrativas", 2, 4, "A", 4), (64, "5.2.1.002", 64, "", "Despesas comerciais", 2, 4, "A", 4), (65, "5.2.1.003", 65, "", "Despesas financeiras", 2, 4, "A", 4), (66, "5.2.1.004", 66, "", "Despesas tribut�rias", 2, 4, "A", 4), (67, "5.2.1.005", 67, "", "Despesas com marketing", 2, 4, "A", 4), (68, "5.2.1.006", 68, "", "Despesas com colaboradores", 2, 4, "A", 4), (69, "5.2.1.007", 69, "", "Despesas com s�cios", 2, 4, "A", 4), (70, "5.2.2", 70, "", "DESPESAS N�O OPERACIONAIS", 2, 4, "S", 3), (71, "5.2.2.001", 71, "", "Despesas com descontos concedidos", 2, 4, "A", 4), (72, "5.2.2.002", 72, "", "Despesas com acr�scimos pagos", 2, 4, "A", 4), (73, "5.2.2.003", 73, "", "Despesas de terceiros", 2, 4, "A", 4), (74, "5.2.2.004", 74, "", "Outras despesas", 2, 4, "A", 4), (75, "6", 75, "", "RESULTADO", 1, 4, "S", 1), (76, "6.1", 76, "", "APURA��O", 1, 4, "S", 2), (77, "6.1.1", 77, "", "APURA��O DE RESULTADO", 1, 4, "S", 3), (78, "6.1.1.001", 78, "", "Resultado do exerc�cio", 1, 4, "A", 4);