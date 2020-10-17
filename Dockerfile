FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS base
WORKDIR /app
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["ApiTasksDemo/ApiTasksDemo.csproj", "ApiTasksDemo/"]
RUN dotnet restore "ApiTasksDemo/ApiTasksDemo.csproj"
COPY . .
WORKDIR "/src/ApiTasksDemo"
RUN dotnet build "ApiTasksDemo.csproj" -c Release -o /app/build
FROM build AS publish
RUN dotnet publish "ApiTasksDemo.csproj" -c Release -o /app/publish
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
CMD ASPNETCORE_URLS=http://*:$PORT dotnet ApiTasksDemo.Web.dll