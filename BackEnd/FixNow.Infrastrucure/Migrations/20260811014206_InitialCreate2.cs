using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FixNow.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TechnicianProfile_Users_UserId",
                table: "TechnicianProfile");

            migrationBuilder.DropIndex(
                name: "IX_TechnicianProfile_UserId",
                table: "TechnicianProfile");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "TechnicianProfile");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "TechnicianProfile",
                newName: "TechnicianId");

            migrationBuilder.AlterColumn<string>(
                name: "VerificationStatus",
                table: "TechnicianProfile",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "TotalReviews",
                table: "TechnicianProfile",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<bool>(
                name: "IsAvailable",
                table: "TechnicianProfile",
                type: "bit",
                nullable: false,
                defaultValue: true,
                oldClrType: typeof(bool),
                oldType: "bit");

            migrationBuilder.AlterColumn<decimal>(
                name: "AverageRating",
                table: "TechnicianProfile",
                type: "decimal(18,2)",
                precision: 18,
                scale: 2,
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            migrationBuilder.AddForeignKey(
                name: "FK_TechnicianProfile_Users_TechnicianId",
                table: "TechnicianProfile",
                column: "TechnicianId",
                principalTable: "Users",
                principalColumn: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TechnicianProfile_Users_TechnicianId",
                table: "TechnicianProfile");

            migrationBuilder.RenameColumn(
                name: "TechnicianId",
                table: "TechnicianProfile",
                newName: "Id");

            migrationBuilder.AlterColumn<int>(
                name: "VerificationStatus",
                table: "TechnicianProfile",
                type: "int",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<int>(
                name: "TotalReviews",
                table: "TechnicianProfile",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldDefaultValue: 0);

            migrationBuilder.AlterColumn<bool>(
                name: "IsAvailable",
                table: "TechnicianProfile",
                type: "bit",
                nullable: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldDefaultValue: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "AverageRating",
                table: "TechnicianProfile",
                type: "decimal(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)",
                oldPrecision: 18,
                oldScale: 2,
                oldDefaultValue: 0m);

            migrationBuilder.AddColumn<Guid>(
                name: "UserId",
                table: "TechnicianProfile",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateIndex(
                name: "IX_TechnicianProfile_UserId",
                table: "TechnicianProfile",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_TechnicianProfile_Users_UserId",
                table: "TechnicianProfile",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
