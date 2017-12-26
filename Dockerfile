FROM microsoft/aspnetcore-build:lts
#download source c?a aspnet core v? docker
WORKDIR /app
#khai b�o working dir trong docker l� /app
EXPOSE 80
#m? c?ng 80 trong docker
COPY . .
#copy t?t c? c�c file ? thu m?c hi?n t?i c?a m�y th?t sang thu m?c /app c?a docker
RUN ["dotnet", "restore"]
#g?i l?nh �dotnet restore� trong docker
RUN ["dotnet", "build"]
#g?i l?nh �dotnet build� trong docker
RUN ["dotnet", "publish","-c","Release","-o","/app"]
#g?i l?nh �dotnet publish �c Release �o /app� trong docker
ENV ASPNETCORE_ENVIRONMENT="Development"
#set bi?n m�i tru?ng trong docker ASPNETCORE_ENVIRONMENT="Development" d? khi docker ch?y aspnet n� s? l?y d�ng file config l� �appsettings.Development.json�, ��y l� n?i dung kh�c bi?t gi?a 2 branch master v� test
ENTRYPOINT ["dotnet", "phuemtest.dll"]
#set m?c d?nh khi start docker s? ch?y chuong tr�nh testdocker.dll