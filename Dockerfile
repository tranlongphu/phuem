FROM microsoft/aspnetcore-build:lts
#download source c?a aspnet core v? docker
WORKDIR /app
#khai báo working dir trong docker là /app
EXPOSE 80
#m? c?ng 80 trong docker
COPY . .
#copy t?t c? các file ? thu m?c hi?n t?i c?a máy th?t sang thu m?c /app c?a docker
RUN ["dotnet", "restore"]
#g?i l?nh “dotnet restore” trong docker
RUN ["dotnet", "build"]
#g?i l?nh “dotnet build” trong docker
RUN ["dotnet", "publish","-c","Release","-o","/app"]
#g?i l?nh “dotnet publish –c Release –o /app” trong docker
ENV ASPNETCORE_ENVIRONMENT="Development"
#set bi?n môi tru?ng trong docker ASPNETCORE_ENVIRONMENT="Development" d? khi docker ch?y aspnet nó s? l?y dúng file config là “appsettings.Development.json”, Ðây là n?i dung khác bi?t gi?a 2 branch master và test
ENTRYPOINT ["dotnet", "phuemtest.dll"]
#set m?c d?nh khi start docker s? ch?y chuong trình testdocker.dll