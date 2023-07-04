import { Form, ActionPanel, Action, showToast } from "@raycast/api";
import { appendFileSync } from "fs";
import { homedir } from "os";
import tags from "../tags.json";

type Values = {
  title: string;
  deadline: Date;
  tags: string[];
};

export default function Command() {
  function handleSubmit(values: Values) {
    if (values.title) {
      showToast({ title: "Submitted form", message: "See logs for submitted values" });
      const deadline = values.deadline || new Date();
      const result = deadline.toLocaleDateString("en-GB", {
        weekday: "short",
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
      });
      const formattedDeadline = result.replace(/(\w+), (..)\/(..)\/(....)/, "$4-$3-$2 $1");
      const todo = `
* TODO ${values.title} :${values.tags.join(":")}:
  DEADLINE: <${formattedDeadline}>`;
      try {
        appendFileSync(`${homedir}/code/org/todos.org`, todo);
      } catch (e) {
        console.log(e);
      }
    }
  }

  return (
    <Form
      actions={
        <ActionPanel>
          <Action.SubmitForm onSubmit={handleSubmit} />
        </ActionPanel>
      }
    >
      <Form.Description text="This form showcases all available form elements." />
      <Form.TextField id="title" title="Title" placeholder="Enter TODO" defaultValue="" />
      <Form.DatePicker id="deadline" title="Due date" />
      <Form.TagPicker id="tags" title="Tag(s)">
        {tags.map((tag) => (
          <Form.TagPicker.Item key={tag.title} value={tag.value} title={tag.title} />
        ))}
      </Form.TagPicker>
      {/*<Form.TextArea id="textarea" title="Text area" placeholder="Enter multi-line text" />
      <Form.Separator />
      <Form.Checkbox id="checkbox" title="Checkbox" label="Checkbox Label" storeValue />
      <Form.Dropdown id="dropdown" title="Dropdown">
        <Form.Dropdown.Item value="dropdown-item" title="Dropdown Item" />
      </Form.Dropdown>
      <Form.TagPicker id="tokeneditor" title="Tag picker">
        <Form.TagPicker.Item value="tagpicker-item" title="Tag Picker Item" />
      </Form.TagPicker>*/}
    </Form>
  );
}
