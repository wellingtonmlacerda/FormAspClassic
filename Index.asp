<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Cliente - Pet Shop</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.es.gov.br/scripts/jquery/1.11.2/jquery-1.11.2.min.js"></script>
    <script src="https://cdn.es.gov.br/scripts/jquery/jquery-mask/1.7.7/jquery.mask.min.js"></script>
    
</head>
<body>
<div class="container">
<h1>Cadastro</h1>
<hr>
    <form action="Index.asp" method="post">
        <form>
            <div class="form-group">
                <label for="lblNomeCompleto">Nome complato</label>
                <input type="text" class="form-control" required id="txtNomeCompleto" name="txtNomeCompleto" placeholder="Seu nome">
            </div>
            <div class="form-group">
                <label for="lblNascimento">Data de nascimento</label>
                <input type="text" class="form-control MaskData" required id="txtNascimento" name="txtNascimento" placeholder="18/10/1993">
            </div>
            <div class="form-group">
                <label for="lblEmail">E-mail</label>
                <input type="email" class="form-control" id="txtEmail" name="txtEmail" aria-describedby="emailHelp" placeholder="Digite seu e-mail">
            </div>
            <div class="form-group">
                <label for="lblCelular">Celular</label>
                <input type="text" class="form-control MaskCell" required id="txtCelular" name="txtCelular" placeholder="(00) 0.0000-0000">
            </div>
            <div class="form-group">
                <label for="lblSexo">Sexo</label>
                <select class="form-control" name="ddlSexo">
                    <option value="" selected>Selecione...</option>
                    <option value="M">Masculino</option>
                    <option value="F">Feminino</option>
                </select>
            </div>
            <div class="form-group">
                <label for="lblCPF">CPF</label>
                <input type="text" class="form-control MaskCpf" required id="txtCPF" name="txtCPF" placeholder="000.000.000-00">
            </div>
            <div class="form-group">
                <label for="lblSenha">Senha</label>
                <input type="password" class="form-control" required id="txtSenha" name="txtSenha" placeholder="Senha">
            </div>
            <div class="form-group">
                <label for="lblConfirmarSenha">Confirmar senha</label>
                <input type="password" class="form-control" required id="txtConfirmarSenha" name="txtConfirmarSenha" placeholder="Confirmar Senha">
            </div>
            <button type="submit" class="btn btn-success" OnClick="Salvo()" >Salvar</button>
        </form>
    </form>
    <% 
    dim NomeCompleto
    dim Nascimento
    dim Email
    dim Celular
    dim Sexo 
    dim CPF
    dim Senha
    NomeCompleto = request.form("txtNomeCompleto")
    Nascimento = request.form("txtNascimento")
    Email = request.form("txtEmail")
    Celular = request.form("txtCelular")
    Sexo = request.form("ddSexo")
    CPF = request.form("txtCPF")
    Senha = request.form("txtSenha")
    if (NomeCompleto <> "" and Nascimento <> "") Then %>
    <br/>
    <table class="table table-striped">
    <thead>
        <tr>
        <th scope="col">#</th>
        <th scope="col">Nome</th>
        <th scope="col">Nascimento</th>
        <th scope="col">E-mail</th>
        <th scope="col">Celular</th>
        <th scope="col">Sexo</th>
        <th scope="col">CPF</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th scope="row">1</th>
        <td><%=response.write(request.form("txtNomeCompleto"))%></td>
        <td><%=response.write(request.form("txtNascimento"))%></td>
        <td><%=response.write(request.form("txtEmail"))%></td>
        <td><%=response.write(request.form("txtCelular"))%></td>
        <td><%=response.write(request.form("ddSexo"))%></td>
        <td><%=response.write(request.form("txtCPF"))%></td>
        </tr>
    </tbody>
    </table>
    <a href="mypdf.pdf" class="btn btn-success" target="blank">Imprimir</a>
    <%End If%>
</div>
<script type="text/javascript">
        $(document).ready(function(){
            $('.MaskCpf').mask('000.000.000-00')
            $('.MaskData').mask('00/00/0000')
            $('.MaskCell').mask('(00) 0.0000-0000')
        });
       function Salvo(){
           if($('#txtNomeCompleto').val() != "" && $('#txtCPF').val() != "" && $('#txtSenha').val() != "" )
            alert('Cadastro realizado com sucesso')
       }
</script>
<%

Function IsCPF(Cpf)
    Dim multiplic1,multiplic2
    multiplic1=Array(10,9,8,7,6,5,4,3,2)
    multiplic2=Array(11,10,9,8,7,6,5,4,3,2)
    Dim tempCpf,digit,sum,remainder,i,RegXP
    Cpf = Trim(Cpf)
    Cpf = Replace(Cpf,".", "")
    Cpf = Replace(Cpf,"-", "")
    If (Len(Cpf) <> 11) Then
        IsCPF = False
    Else
        tempCpf = Left(Cpf,9)
        sum = 0
        Dim intCounter
        Dim intLen
        Dim arrChars()
        intLen = Len(tempCpf)-1
        Redim arrChars(intLen)
        For intCounter = 0 to intLen
            arrChars(intCounter) = Mid(tempCpf, intCounter + 1,1)
        Next
        i=0
        For i = 0 to 8
            sum =sum + CInt(arrChars(i)) * multiplic1(i)
        Next
        remainder = sum Mod 11
        If (remainder < 2) Then
            remainder = 0
        Else
            remainder = 11 - remainder
        End If
        digit = CStr(remainder)
        tempCpf = tempCpf & digit
        sum = 0
        intLen = Len(tempCpf)-1
        Redim arrChars(intLen)
        intCounter= 0
        For intCounter = 0 to intLen
            arrChars(intCounter) = Mid(tempCpf, intCounter + 1,1)
        Next
        i=0
        For i = 0 to 9
            sum =sum + CInt(arrChars(i)) * multiplic2(i)
        Next     
        remainder = sum Mod 11
        If (remainder < 2) Then
            remainder = 0
        Else
            remainder = 11 - remainder
        End If   
        digit = digit & CStr(remainder)
        Set RegXP=New RegExp
            RegXP.IgnoreCase=1
            RegXP.Pattern=digit & "$"
        If RegXP.test(Cpf) Then
   RegXP.Pattern="\b(\d)\1+\b"
   If Not RegXP.test(Cpf) Then
    IsCPF = True
   Else
    IsCPF = False
   End if
        Else
            IsCPF = False
        End If
    End If
End Function

dim FCpf
FCpf = request.form("txtCPF")
if(FCpf <> "" or FCpf <> null) then
    If (Not IsCPF(FCpf)) Then
        response.write("<script>alert('Informe o CPF corretamente');</script>")
    End If
End if

%>

    <!--#include file="fpdf.asp"-->
    <%


    Set pdf=CreateJsObject("FPDF")
    pdf.CreatePDF()
    pdf.SetPath("fpdf/")
    pdf.SetFont "Arial","",12
    pdf.Open()
    pdf.AddPage()
    pdf.SetXY 10,13
    pdf.setfillcolor 255,255,255
    pdf.Cell 0,0,"Nome: "+NomeCompleto,0,0,,0
    pdf.SetXY 10,18
    pdf.Cell 0,0,"Nascimento: "+Nascimento,0,0,,0
    pdf.SetXY 10,23
    pdf.Cell 0,0,"E-mail: "+Email,0,0,,0
    pdf.SetXY 10,28
    pdf.Cell 0,0,"Celular: "+Celular,0,0,,0
    pdf.SetXY 10,33
    pdf.Cell 0,0,"Sexo: "+Sexo,0,0,,0
    pdf.SetXY 10,38
    pdf.Cell 0,0,"CPF: "+CPF,0,0,,0
    pdf.SetXY 10,43
    pdf.Cell 0,0,"Senha: "+Senha,0,0,,0
    pdf.Close()
    filewrite=Server.MapPath("mypdf.pdf")
    pdf.Output filewrite
    %>
    </body>
</html>