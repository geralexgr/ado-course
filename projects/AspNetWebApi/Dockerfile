FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 7057

ENV ASPNETCORE_URLS=http://*:7057
ENV ASPNETCORE_ENVIRONMENT=Development

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["AspNetWebApi.csproj", "./"]
RUN dotnet restore "AspNetWebApi.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "AspNetWebApi.csproj" -c Debug -o /app/build

FROM build AS publish
RUN dotnet publish "AspNetWebApi.csproj" -c Debug -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AspNetWebApi.dll"]
