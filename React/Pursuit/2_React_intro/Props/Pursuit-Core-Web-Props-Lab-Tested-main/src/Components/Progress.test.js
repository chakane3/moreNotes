import { render, screen } from "@testing-library/react";
import Progress from "./Progress";

describe("Progress", () => {
  it("renders goal out of total", () => {
    render(<Progress goal={246} total={123} />);

    expect(screen.getByRole("heading", { level: 2 }).textContent).toEqual(`Raised $123 of $246`);
  });
});
