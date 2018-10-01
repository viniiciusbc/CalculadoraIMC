<%@page import="javax.xml.bind.ParseConversionEvent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Calcular IMC</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body style="background-color: aqua">     
        <div class="container"> 
            <div id="calcbox" style=" margin-top:50px"  class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Calc IMC</div>
                    </div>  
                    <div class="panel-body" >
                        <form method="get" action="index.jsp">
                            <div id="div_id_nome" class="form-group required">
                                <label for="id_nome" class="control-label col-md-4  requiredField"> Nome</label>
                                <div class="controls col-md-8 ">
                                    <input class="input-md  textinput textInput form-control" id="id_nome" maxlength="30" name="nome" placeholder="Insira seu nome" style="margin-bottom: 10px" type="text" />
                                </div>
                            </div>
                            <div id="div_id_peso" class="form-group required">
                                <label for="id_peso" class="control-label col-md-4  requiredField"> Peso<span class="asteriskField">*</span> </label>
                                <div class="controls col-md-8 ">
                                    <input class="input-md textlinput form-control" id="id_peso" name="peso" placeholder="Peso (Kg)" style="margin-bottom: 10px" type="text" step=".1" />
                                </div>     
                            </div>
                            <div id="div_id_altura" class="form-group required">
                                <label for="id_altura" class="control-label col-md-4  requiredField">Altura<span class="asteriskField">*</span> </label>
                                <div class="controls col-md-8 "> 
                                    <input class="input-md numberinput form-control" id="id_altura" name="altura" placeholder="Altura (cm)" style="margin-bottom: 10px" type="text" />
                                </div>
                            </div> 
                            <div id="div_id_idade" class="form-group required">
                                <label for="id_idade" class="control-label col-md-4  requiredField">Idade</label>
                                <div class="controls col-md-8 "> 
                                    <input class="input-md numberinput textInput form-control" id="id_idade" name="idade" placeholder="Idade" style="margin-bottom: 10px" type="number" />
                                </div>
                            </div>
                            <div id="div_id_sexo" class="form-group required">
                                <label for="id_sexo"  class="control-label col-md-4  requiredField"> Sexo</label>
                                <div class="controls col-md-8 "  style="margin-bottom: 10px">
                                     <label class="radio-inline"> <input type="radio" name="sexo" id="id_sexo_1" value="M"  style="margin-bottom: 10px">Masculino</label>
                                     <label class="radio-inline"> <input type="radio" name="sexo" id="id_sexo_2" value="F"  style="margin-bottom: 10px">Feminino</label>
                                </div>
                            </div>
                            <div class="form-group"> 
                                <div class="aab controls col-md-4 "></div>
                                <div class="controls col-md-8 ">
                                    <input type="submit" name="Calc" value="Calcular" class="btn btn-primary btn btn-info" id="submit-id-calc" />
                                    <%
                                      int peso_fim = 0;
                                      double altura_fim = 0; 
                                      double resultado = 0;
                                      String resultado_fim;                                      
                                      String nome = request.getParameter("nome");
                                      String peso = request.getParameter("peso");
                                      String altura = request.getParameter("altura");
                                    	peso = peso.replaceAll(",", ".");
                                    	peso_fim =Integer.parseInt(peso);                                    	
                                    	altura = altura.replaceAll(",", ".");
                                    	altura_fim = Double.parseDouble(altura);
                                    	resultado = peso_fim/(altura_fim*altura_fim);
                                    	resultado_fim = Double.toString(resultado);
                                    %>
                                    	
                                </div>
                            </div>                             
                        </form> 
                    </div>
                </div>
            </div> 
        </div>  
        <div class="container">
            <div id="resultbox" style="margin-top: 15px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Resultado IMC</div>
                    </div>
                    <div class="panel-body">
                    	<h3>Olá <%out.print(nome);%>, seu IMC: <%out.print('4'); %></h3>
                        <table class="table">
						  <thead>
						    <tr>
						      <th scope="col">Classificação</th>
						      <th scope="col">IMC</th>
						      <th scope="col">PESO</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <td>Magreza</td>
						      <td>< 18.5</td>
						      <td>< 47.4 Kg</td>
						    </tr>
						    <tr>
						      <td>Normal</td>
						      <td>18.05 a 24.9</td>
						      <td>47.4 a 63.7 Kg</td>
						    </tr>
						    <tr>
						      <td>Sobrepeso</td>
						      <td>24.9 a 30</td>
						      <td>63.7 a 76.8 Kg</td>
						    </tr>
						    <tr>
						      <td>Obesidade</td>
						      <td>> 30</td>
						      <td>> 76.8 Kg</td>
						    </tr>
						  </tbody>
						</table>                    	
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>