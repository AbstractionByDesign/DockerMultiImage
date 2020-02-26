FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["App.csproj", "App/"]
WORKDIR /src/App
RUN dotnet restore "App.csproj"
COPY . .
RUN dotnet build "App.csproj" -c Release -o output
RUN dotnet publish "App.csproj" -c Release -o /src/App/output

EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS base
WORKDIR /src/App/output

FROM base AS final
WORKDIR /app
COPY --from=build /src/App/output .
ENTRYPOINT ["dotnet", "App.dll"]