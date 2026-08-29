using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FixNow.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddTechnicianDocuments : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TechnicianDocuments",
                columns: table => new
                {
                    DocumentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "NEWSEQUENTIALID()"),
                    TechnicianId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Type = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    FileUrl = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    UploadedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TechnicianDocuments", x => x.DocumentId);
                    table.ForeignKey(
                        name: "FK_TechnicianDocuments_TechnicianProfile_TechnicianId",
                        column: x => x.TechnicianId,
                        principalTable: "TechnicianProfile",
                        principalColumn: "TechnicianId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_TechnicianDocuments_TechnicianId",
                table: "TechnicianDocuments",
                column: "TechnicianId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TechnicianDocuments");
        }
    }
}
