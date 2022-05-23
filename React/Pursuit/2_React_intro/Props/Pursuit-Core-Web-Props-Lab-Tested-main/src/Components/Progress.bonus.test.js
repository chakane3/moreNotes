import { render, screen } from "@testing-library/react";
import Progress from "./Progress";

describe("Progress Bonus", () => {
  it("renders a low percentage", () => {
    render(<Progress goal={200} total={50} />);

    expect(screen.getByRole("progressbar").textContent).toEqual(`25.00%`);
  });

  it("renders a high percentage", () => {
    render(<Progress goal={200} total={175} />);

    expect(screen.getByRole("progressbar").textContent).toEqual(`87.50%`);
  });
});
