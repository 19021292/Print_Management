using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Print_Management.Migrations
{
    /// <inheritdoc />
    public partial class v1_1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Designs_Projects_ProjectId",
                table: "Designs");

            migrationBuilder.DropForeignKey(
                name: "FK_Designs_Users_DesignerId",
                table: "Designs");

            migrationBuilder.AddForeignKey(
                name: "FK_Designs_Projects_ProjectId",
                table: "Designs",
                column: "ProjectId",
                principalTable: "Projects",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Designs_Users_DesignerId",
                table: "Designs",
                column: "DesignerId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
            migrationBuilder.AlterColumn<string>(
    name: "DesignStatus",
    table: "Designs",
    type: "nvarchar(max)",
    nullable: false,
    oldClrType: typeof(int),
    oldType: "int");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Designs_Projects_ProjectId",
                table: "Designs");

            migrationBuilder.DropForeignKey(
                name: "FK_Designs_Users_DesignerId",
                table: "Designs");

            migrationBuilder.AddForeignKey(
                name: "FK_Designs_Projects_ProjectId",
                table: "Designs",
                column: "ProjectId",
                principalTable: "Projects",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Designs_Users_DesignerId",
                table: "Designs",
                column: "DesignerId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
            migrationBuilder.AlterColumn<int>(
            name: "DesignStatus",
            table: "Designs",
            type: "int",
            nullable: false,
            oldClrType: typeof(string),
            oldType: "nvarchar(max)");
        }
    }
}
