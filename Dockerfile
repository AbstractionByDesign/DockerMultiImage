FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["DockerImageTest/API.csproj", "API/"]
RUN dotnet restore "DockerImageTest/API.csproj"
COPY . .
WORKDIR /src/API
RUN dotnet build "API.csproj" -c Release -o output
RUN dotnet publish "API.csproj" -c Release -o /src/API/output

EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /src/API/output

FROM base AS final
WORKDIR /app
COPY --from=publish /src/API/output .
ENTRYPOINT ["dotnet", "API.dll"]