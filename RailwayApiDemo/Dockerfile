# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy csproj and restore
COPY RailwayApiDemo.csproj ./
RUN dotnet restore RailwayApiDemo.csproj

# Copy all other files
COPY . ./
RUN dotnet publish RailwayApiDemo.csproj -c Release -o /out

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /out .
ENTRYPOINT ["dotnet", "RailwayApiDemo.dll"]
