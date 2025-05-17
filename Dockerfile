# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy csproj and restore dependencies
COPY RailwayApiDemo.csproj ./
RUN dotnet restore RailwayApiDemo.csproj

# Copy everything else and build
COPY . .
RUN dotnet publish RailwayApiDemo.csproj -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "RailwayApiDemo.dll"]
